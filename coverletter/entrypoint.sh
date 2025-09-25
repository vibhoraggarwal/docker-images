#!/bin/bash
# dynamically create user at runtime
groupadd -g ${USER_GID} ${USERNAME} 2>/dev/null || true
useradd -m -u ${USER_UID} -g ${USER_GID} ${USERNAME} 2>/dev/null || true
exec gosu ${USERNAME} "$@"