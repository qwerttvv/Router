cmake_minimum_required(VERSION 3.21)

project(omcproxy C)

add_executable(omcproxy src/client.c src/mrib.c src/querier.c src/groups.c src/igmp.c src/mld.c src/proxy.c src/omcproxy.c libubox/uloop.c libubox/avl.c libubox/blobmsg.c libubox/blob.c)

if(${L_LEVEL})
  add_definitions(-DL_LEVEL=${L_LEVEL})
endif(${L_LEVEL})

target_compile_features(omcproxy PRIVATE c_std_99)
target_compile_definitions(omcproxy PRIVATE _GNU_SOURCE _TIME_BITS=64 _FILE_OFFSET_BITS=64)
target_compile_options(omcproxy PRIVATE -Wall -g)
target_include_directories(omcproxy BEFORE PRIVATE .)

install(TARGETS omcproxy DESTINATION sbin/)
