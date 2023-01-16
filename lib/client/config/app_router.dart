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

GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
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
          path: 'election-detail/:electionId',
          builder: (BuildContext context, GoRouterState state) {
            return ElectionDashboard(id: state.params['electionId']!);
          },
          routes: <GoRoute>[
            // Voting
            GoRoute(
                path: 'voting',
                builder: (BuildContext context, GoRouterState state) {
                  return Voting(id: state.params['electionId']!);
                },
                routes: [
                  GoRoute(
                    path: 'voting-casted',
                    builder: (BuildContext context, GoRouterState state) {
                      return VotingCasted(id: state.params['electionId']!);
                    },
                  )
                ])
          ],
        ),
        // Register to an organization
        GoRoute(
          path: 'register-organization',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterOrganization();
          },
          routes: [
            GoRoute(
              path: 'confirmation',
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
        // Register to an election
        GoRoute(
          path: 'register-election',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterOrganization();
          },
          routes: [
            GoRoute(
              path: 'confirmation',
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
