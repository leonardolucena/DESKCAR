import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract final class AppPageTransitions {
  static const Duration duration = Duration(milliseconds: 280);
  static const Curve curve = Curves.easeInOutCubic;

  /// Transição entre abas da bottom bar.
  static CustomTransitionPage<T> tab<T>({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: key,
      child: child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(parent: animation, curve: curve);

        return FadeTransition(
          opacity: curved,
          child: child,
        );
      },
    );
  }

  /// Telas empilhadas (garagem, detalhe do veículo).
  static CustomTransitionPage<T> push<T>({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: key,
      child: child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(parent: animation, curve: curve);
        final slide = Tween<Offset>(
          begin: const Offset(0.04, 0),
          end: Offset.zero,
        ).animate(curved);

        return SlideTransition(
          position: slide,
          child: FadeTransition(
            opacity: curved,
            child: child,
          ),
        );
      },
    );
  }

  /// Formulários e fluxos modais (adicionar/editar).
  static CustomTransitionPage<T> modal<T>({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: key,
      child: child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(parent: animation, curve: curve);
        final slide = Tween<Offset>(
          begin: const Offset(0, 0.06),
          end: Offset.zero,
        ).animate(curved);

        return SlideTransition(
          position: slide,
          child: FadeTransition(
            opacity: curved,
            child: child,
          ),
        );
      },
    );
  }
}
