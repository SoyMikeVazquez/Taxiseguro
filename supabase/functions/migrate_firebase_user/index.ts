import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const { email, password } = await req.json()
    
    if (!email || !password) {
      return new Response(JSON.stringify({ error: 'Email and password required' }), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 400,
      })
    }

    const cleanEmail = email.trim().toLowerCase()

    const firebaseApiKey = Deno.env.get('FIREBASE_API_KEY')
    if (!firebaseApiKey) {
      throw new Error('Missing FIREBASE_API_KEY environment variable')
    }

    // 1. Verify password with Firebase REST API
    const firebaseUrl = `https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${firebaseApiKey}`
    const firebaseRes = await fetch(firebaseUrl, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: cleanEmail, password, returnSecureToken: true }),
    })

    const firebaseData = await firebaseRes.json()

    if (!firebaseRes.ok) {
      // Password invalid in Firebase (or user not found)
      return new Response(
        JSON.stringify({ 
          error: 'Credenciales inválidas en Firebase', 
          details: firebaseData 
        }),
        { 
          headers: { ...corsHeaders, 'Content-Type': 'application/json' }, 
          status: 401 
        }
      )
    }

    // 2. Password is correct in Firebase! Now find user in Supabase & update password
    const supabaseUrl = Deno.env.get('SUPABASE_URL') ?? ''
    const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''

    const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey, {
      auth: {
        autoRefreshToken: false,
        persistSession: false
      }
    })

    let targetUserId = null
    let page = 1
    const perPage = 500

    while (!targetUserId && page <= 20) {
      const { data, error } = await supabaseAdmin.auth.admin.listUsers({
        page: page,
        perPage: perPage,
      })

      if (error) throw error
      if (!data || !data.users || data.users.length === 0) break

      const found = data.users.find(u => u.email?.toLowerCase() === cleanEmail)
      if (found) {
        targetUserId = found.id
        break
      }

      if (data.users.length < perPage) break
      page++
    }

    if (!targetUserId) {
      return new Response(
        JSON.stringify({ error: 'User not found in Supabase auth.users' }),
        { 
          headers: { ...corsHeaders, 'Content-Type': 'application/json' }, 
          status: 404 
        }
      )
    }

    // Update their password to Bcrypt (Supabase native)
    const { error: updateError } = await supabaseAdmin.auth.admin.updateUserById(
      targetUserId,
      { password: password }
    )

    if (updateError) {
      throw updateError
    }

    return new Response(
      JSON.stringify({ success: true, message: 'Password migrated successfully' }),
      { 
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }, 
        status: 200 
      }
    )

  } catch (error) {
    console.error('Migration error:', error)
    return new Response(
      JSON.stringify({ error: error.message || 'Internal Server Error' }),
      { 
        headers: { ...corsHeaders, 'Content-Type': 'application/json' }, 
        status: 500 
      }
    )
  }
})
