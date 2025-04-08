import 'package:flutter/material.dart';

/// Tipos de animaciones
enum AnimationType { normal, fadeIn }

/// Main class, [context] es el BuildContext de la aplicacion en este momento
/// [child] es el widget a naveggar, [animation] es el tipo de animacion
class NextTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  NextTransitions({
    required this.context,
    required this.child,
    this.replacement = false,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
  }) {
    switch (this.animation) {
      case AnimationType.normal:
        this._normalTransition();
        break;
      case AnimationType.fadeIn:
        this._fadeInTransition();
        break;
    }
  }

  /// Push normal de la pagina
  void _pushPage(Route route) => Navigator.push(context, route);

  /// Push replacement de la pagina
  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  /// Codigo de una transicion normal
  void _normalTransition() {
    final route = MaterialPageRoute(builder: (_) => this.child);

    (this.replacement)
        ? this._pushReplacementPage(route)
        : this._pushPage(route);
  }

  /// Controlador de la transicion con fadeIn
  void _fadeInTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => this.child,
      transitionDuration: this.duration,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: child,
        );
      },
    );

    (this.replacement)
        ? this._pushReplacementPage(route)
        : this._pushPage(route);
  }
}
