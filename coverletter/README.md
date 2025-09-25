# Coverletter

Docker image for generating cover letters using LaTeX.

Image is located at: [vibhorag24/coverletter](https://hub.docker.com/r/vibhorag24/coverletter)

## Example Usage in devcontainer

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
