# Coverletter

Docker image for generating cover letters using LaTeX.

Image is located at: [vibhorag24/coverletter](https://hub.docker.com/r/vibhorag24/coverletter)

## Usage in devcontainer

```json
{
  "name": "Documentation Container",
  "image": "vibhorag24/coverletter:latest",
  "remoteUser": "vscode",
  "workspaceFolder": "/workspace",
  "mounts": [
            "source=${localWorkspaceFolder},target=/workspace,type=bind,consistency=cached"
            ]
}
```

### Additional Dockerfile information

Devcontainer at time does not allow the docker images to be adapted on runtime. Thus, the following addition to the Dockerfile is required to allow the vscode user to run the entrypoint script.

```Dockerfile
# Use your prebuilt image as base
ARG BASE_IMAGE=vibhorag24/coverletter:latest
FROM ${BASE_IMAGE}

# Accept UID/GID as build arguments
ARG USERNAME=vscode

# Create user with build-time UID/GID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -m --uid $USER_UID --gid $USER_GID -s /bin/bash $USERNAME

USER $USERNAME
WORKDIR /workspace

# Add alias to the .bashrc of the non-root user
RUN echo "alias gen_tex_doc='pdflatex -shell-escape vibhor_coverletter.tex'" >> /home/${USERNAME}/.bashrc && \
    chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.bashrc

CMD ["bash"]
```

and, subsequent adaptations to the .devcontainer.json

```json
{
    "name": "Documentation Container",
    "build": {
        "dockerfile": "Dockerfile",
        "args": {
            "USER_UID": "${localEnv:USER_UID}",
            "USER_GID": "${localEnv:USER_GID}",
            "USERNAME": "${localEnv:USERNAME}"
        }
    },
    ...
}
```
