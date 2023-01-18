import 'package:ecclesia_ui/client/screens/home.dart';
import 'package:ecclesia_ui/client/screens/election_dashboard.dart';
import 'package:ecclesia_ui/client/screens/past_elections.dart';
import 'package:ecclesia_ui/client/screens/register_camera.dart';
import 'package:ecclesia_ui/client/screens/register_confirmation.dart';
import 'package:ecclesia_ui/client/screens/register_confirmed.dart';
import 'package:ecclesia_ui/client/screens/register_page.dart';
import 'package:ecclesia_ui/client/screens/result.dart';
import 'package:ecclesia_ui/client/screens/voting.dart';
import 'package:ecclesia_ui/client/screens/voting_casted.dart';
import 'package:ecclesia_ui/server/bloc/logged_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider.value(
        value: BlocProvider.of<LoggedUserBloc>(context)..add(const LoginLoggedUserEvent(userId: "1")),
        child: BlocBuilder<LoggedUserBloc, LoggedUserState>(
          builder: (context, state) {
            if (state is LoggedUserLoaded) {
              return Home(user: state.user);
            } else {
              return const CircularProgressIndicator(color: Colors.blue);
            }
          },
        ),
      ),
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
          path: 'election-detail/:electionId/:userId',
          builder: (BuildContext context, GoRouterState state) {
            return ElectionDashboard(id: state.params['electionId']!, userId: state.params['userId']!);
          },
          routes: <GoRoute>[
            // Voting
            GoRoute(
                path: 'voting',
                builder: (BuildContext context, GoRouterState state) {
                  return Voting(id: state.params['electionId']!, userId: state.params['userId']!);
                },
                routes: [
                  GoRoute(
                    path: 'voting-casted',
                    builder: (BuildContext context, GoRouterState state) {
                      return VotingCasted(id: state.params['electionId']!, userId: state.params['userId']!);
                    },
                  )
                ]),
            // Result
            GoRoute(
                path: 'result',
                builder: (BuildContext context, GoRouterState state) {
                  return Result(id: state.params['electionId']!, userId: state.params['userId']!);
                })
          ],
        ),
        // Register to an organization
        GoRoute(
          path: 'register-organization',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterPage(isElection: false);
          },
          routes: [
            GoRoute(
                path: 'confirmation',
                builder: (BuildContext context, GoRouterState state) {
                  return const RegisterConfirmation(
                    isElection: false,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'confirmed',
                    builder: (BuildContext context, GoRouterState state) {
                      return const RegisterConfirmed(
                        isElection: false,
                      );
                    },
                  ),
                ]),
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
            return const RegisterPage(isElection: true);
          },
          routes: [
            GoRoute(
                path: 'confirmation',
                builder: (BuildContext context, GoRouterState state) {
                  return const RegisterConfirmation(isElection: true);
                },
                routes: [
                  GoRoute(
                    path: 'confirmed',
                    builder: (BuildContext context, GoRouterState state) {
                      return const RegisterConfirmed(isElection: true);
                    },
                  ),
                ]),
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
