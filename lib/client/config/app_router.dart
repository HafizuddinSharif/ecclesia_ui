import 'package:ecclesia_ui/client/screens/home.dart';
import 'package:ecclesia_ui/client/screens/election_dashboard.dart';
import 'package:ecclesia_ui/client/screens/past_elections.dart';
import 'package:ecclesia_ui/client/screens/register_camera.dart';
import 'package:ecclesia_ui/client/screens/register_confirmation.dart';
import 'package:ecclesia_ui/client/screens/register_organization.dart';
import 'package:ecclesia_ui/client/screens/voting.dart';
import 'package:ecclesia_ui/client/screens/voting_casted.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Home();
      },
      routes: <GoRoute>[
        // Past Elections
        GoRoute(
          path: 'past-elections',
          builder: (BuildContext context, GoRouterState state) {
            return const PastElections();
          },
        ),
        // Election Detail
        GoRoute(
          path: 'election-detail',
          builder: (BuildContext context, GoRouterState state) {
            return const ElectionDashboard();
          },
          routes: <GoRoute>[
            // Voting
            GoRoute(
                path: 'voting',
                builder: (BuildContext context, GoRouterState state) {
                  return const Voting();
                },
                routes: [
                  GoRoute(
                    path: 'voting-casted',
                    builder: (BuildContext context, GoRouterState state) {
                      return const VotingCasted();
                    },
                  )
                ])
          ],
        ),
        // Register to Organization
        GoRoute(
          path: 'register-organization',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterOrganization();
          },
          routes: [
            GoRoute(
              path: 'register-organization-confirmation',
              builder: (BuildContext context, GoRouterState state) {
                return const RegisterConfirmation();
              },
            ),
            GoRoute(
              path: 'camera',
              builder: (BuildContext context, GoRouterState state) {
                return const RegisterCamera();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
