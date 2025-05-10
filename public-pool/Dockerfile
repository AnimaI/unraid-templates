#35 237.2 npm error gyp info spawn args   '-Dlibrary=shared_library',
#35 237.2 npm error gyp info spawn args   '-Dvisibility=default',
#35 237.2 npm error gyp info spawn args   '-Dnode_root_dir=/root/.cache/node-gyp/22.15.0',
#35 237.2 npm error gyp info spawn args   '-Dnode_gyp_dir=/build-backend/node_modules/node-gyp',
#35 237.2 npm error gyp info spawn args   '-Dnode_lib_file=/root/.cache/node-gyp/22.15.0/<(target_arch)/node.lib',
#35 237.2 npm error gyp info spawn args   '-Dmodule_root_dir=/build-backend/node_modules/zeromq',
#35 237.2 npm error gyp info spawn args   '-Dnode_engine=v8',
#35 237.2 npm error gyp info spawn args   '--depth=.',
#35 237.2 npm error gyp info spawn args   '--no-parallel',
#35 237.2 npm error gyp info spawn args   '--generator-output',
#35 237.2 npm error gyp info spawn args   'build',
#35 237.2 npm error gyp info spawn args   '-Goutput_dir=.'
#35 237.2 npm error gyp info spawn args ]
#35 237.2 npm error gyp info spawn make
#35 237.2 npm error gyp info spawn args [ 'BUILDTYPE=Release', '-C', 'build' ]
#35 237.2 npm error /bin/sh: 1: curl: not found
#35 237.2 npm error tar (child): libzmq-20de92ac0a2b2b9a1869782a429df68f93c3625e.tar.gz: Cannot open: No such file or directory
#35 237.2 npm error tar (child): Error is not recoverable: exiting now
#35 237.2 npm error tar: Child returned status 2
#35 237.2 npm error tar: Error is not recoverable: exiting now
#35 237.2 npm error /bin/sh: 1: cmake: not found
#35 237.2 npm error /bin/sh: 1: cmake: not found
#35 237.2 npm error In file included from ../src/context.h:4,
#35 237.2 npm error                  from ../src/context.cc:2:
#35 237.2 npm error ../src/prefix.h:8:10: fatal error: zmq.h: No such file or directory
#35 237.2 npm error     8 | #include <zmq.h>
#35 237.2 npm error       |          ^~~~~~~
#35 237.2 npm error compilation terminated.
#35 237.2 npm error make: *** [zeromq.target.mk:127: Release/obj.target/zeromq/src/context.o] Error 1
#35 237.2 npm error gyp ERR! build error 
#35 237.2 npm error gyp ERR! stack Error: `make` failed with exit code: 2
#35 237.2 npm error gyp ERR! stack     at ChildProcess.onExit (/build-backend/node_modules/node-gyp/lib/build.js:194:23)
#35 237.2 npm error gyp ERR! stack     at ChildProcess.emit (node:events:518:28)
#35 237.2 npm error gyp ERR! stack     at ChildProcess._handle.onexit (node:internal/child_process:293:12)
#35 237.2 npm error gyp ERR! System Linux 6.11.0-1013-azure
#35 237.2 npm error gyp ERR! command "/usr/local/bin/node" "/build-backend/node_modules/.bin/node-gyp" "rebuild"
#35 237.2 npm error gyp ERR! cwd /build-backend/node_modules/zeromq
#35 237.2 npm error gyp ERR! node -v v22.15.0
#35 237.2 npm error gyp ERR! node-gyp -v v8.4.1
#35 237.2 npm error gyp ERR! not ok
#35 237.2 npm notice
#35 237.2 npm notice New major version of npm available! 10.9.2 -> 11.3.0
#35 237.2 npm notice Changelog: https://github.com/npm/cli/releases/tag/v11.3.0
#35 237.2 npm notice To update run: npm install -g npm@11.3.0
#35 237.2 npm notice
#35 237.2 npm error A complete log of this run can be found in: /root/.npm/_logs/2025-05-10T16_06_49_849Z-debug-0.log
#35 ERROR: process "/bin/sh -c npm ci && npm run build" did not complete successfully: exit code: 1

#32 [linux/arm64 ui-build 5/5] RUN npm ci && npm run build
#32 CANCELED
------
 > [linux/arm64 backend-build 5/6] RUN npm ci && npm run build:
237.2 npm error gyp ERR! cwd /build-backend/node_modules/zeromq
237.2 npm error gyp ERR! node -v v22.15.0
237.2 npm error gyp ERR! node-gyp -v v8.4.1
237.2 npm error gyp ERR! not ok
237.2 npm notice
237.2 npm notice New major version of npm available! 10.9.2 -> 11.3.0
237.2 npm notice Changelog: https://github.com/npm/cli/releases/tag/v11.3.0
237.2 npm notice To update run: npm install -g npm@11.3.0
237.2 npm notice
237.2 npm error A complete log of this run can be found in: /root/.npm/_logs/2025-05-10T16_06_49_849Z-debug-0.log
------

 1 warning found (use docker --debug to expand):
 - SecretsUsedInArgOrEnv: Do not use ARG or ENV instructions for sensitive data (ENV "BITCOIN_RPC_PASSWORD") (line 60)
Dockerfile:20
--------------------
  18 |     RUN git clone https://github.com/AnimaI/public-pool.git .
  19 |     # Build the backend
  20 | >>> RUN npm ci && npm run build
  21 |     
  22 |     RUN ls -la /build-backend/dist/ || echo "FEHLER: /build-backend/dist/ existiert nicht oder ist leer"
--------------------
ERROR: failed to solve: process "/bin/sh -c npm ci && npm run build" did not complete successfully: exit code: 1
Error: Process completed with exit code 1.
