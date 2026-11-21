import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../services/mercado_pago_service.dart';

class MercadoPagoWebViewScreen extends StatefulWidget {
  final String initPointUrl;
  final double amount;
  final String? tripTitle;

  const MercadoPagoWebViewScreen({
    super.key,
    required this.initPointUrl,
    required this.amount,
    this.tripTitle,
  });

  @override
  State<MercadoPagoWebViewScreen> createState() => _MercadoPagoWebViewScreenState();
}

class _MercadoPagoWebViewScreenState extends State<MercadoPagoWebViewScreen> {
  late final WebViewController _controller;
  double _progress = 0.0;
  bool _isLoading = true;
  bool _hasReturned = false;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (mounted) {
              setState(() {
                _progress = progress / 100.0;
                _isLoading = progress < 100;
              });
            }
          },
          onPageStarted: (String url) {
            _handleUrlChange(url);
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
            _handleUrlChange(url);
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Error en WebView de Mercado Pago: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (_isPaymentCallbackUrl(request.url)) {
              _processPaymentCallback(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initPointUrl));
  }

  bool _isPaymentCallbackUrl(String url) {
    if (url.startsWith('https://taxiseguro.mx/payment/')) {
      return true;
    }
    final uri = Uri.tryParse(url);
    if (uri != null && uri.host == 'taxiseguro.mx' && uri.path.contains('/payment')) {
      return true;
    }
    return false;
  }

  void _handleUrlChange(String url) {
    if (_hasReturned) return;
    if (_isPaymentCallbackUrl(url)) {
      _processPaymentCallback(url);
    }
  }

  void _processPaymentCallback(String rawUrl) {
    if (_hasReturned) return;
    _hasReturned = true;

    final uri = Uri.tryParse(rawUrl);
    final params = uri?.queryParameters ?? {};

    final status = params['status'] ?? params['collection_status'] ?? '';
    final paymentId = params['payment_id'] ?? params['collection_id'];

    final bool isApproved = status == 'approved' || rawUrl.contains('/payment/success');
    final bool isRejected = status == 'rejected' || rawUrl.contains('/payment/failure');

    String message;
    if (isApproved) {
      message = 'Pago acreditado correctamente.';
    } else if (isRejected) {
      message = 'El pago fue rechazado. Intenta con otro metodo.';
    } else {
      message = 'El pago se encuentra en proceso o pendiente.';
    }

    final result = MercadoPagoPaymentResult(
      isApproved: isApproved,
      paymentId: paymentId,
      status: status.isNotEmpty ? status : (isApproved ? 'approved' : 'failed'),
      message: message,
    );

    if (mounted) {
      Navigator.of(context).pop(result);
    }
  }

  Future<void> _handleBackPress() async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
            SizedBox(width: 8),
            Text('Cancelar Pago'),
          ],
        ),
        content: const Text(
          '¿Deseas salir del proceso de pago? Si sales ahora, el viaje no sera solicitado.',
          style: TextStyle(fontSize: 14, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Continuar Pagando', style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Salir y Cancelar'),
          ),
        ],
      ),
    );

    if (shouldPop == true) {
      if (mounted) {
        Navigator.of(context).pop(
          const MercadoPagoPaymentResult(
            isApproved: false,
            status: 'cancelled',
            message: 'Pago cancelado por el usuario.',
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _handleBackPress();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black87),
            onPressed: _handleBackPress,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  Icon(Icons.shield, color: Color(0xFF009EE3), size: 16),
                  SizedBox(width: 6),
                  Text(
                    'Pago Seguro Mercado Pago',
                    style: TextStyle(
                      fontFamily: 'Google Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                'Total a pagar: \$${widget.amount.toStringAsFixed(2)} MXN',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF009EE3),
                ),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.lock_outline, color: Colors.green, size: 20),
            ),
          ],
          bottom: _isLoading
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(3.0),
                  child: LinearProgressIndicator(
                    value: _progress > 0 ? _progress : null,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF009EE3)),
                  ),
                )
              : null,
        ),
        body: SafeArea(
          child: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }
}
