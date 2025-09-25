#!/bin/bash
set -e
# dynamically create user at runtime

# Create group if not exists
if ! getent group $USERNAME >/dev/null; then
    groupadd -g ${USER_GID:-1000} $USERNAME
fi

# Create user if not exists
if ! id -u $USERNAME >/dev/null 2>&1; then
    useradd -m -u ${USER_UID:-1000} -g ${USER_GID:-1000} -s /bin/bash $USERNAME
fi
exec gosu ${USERNAME} "$@"