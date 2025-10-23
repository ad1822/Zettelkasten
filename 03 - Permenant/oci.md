---
cssclasses:
  - center-images
  - center-titles
---
Tags: #docker, #containergo

# OCI

### Format

- A container image is a snapshot of a filesystem. It includes everything needed to run an application- the code, runtime, libraries and system tools. The OCI Image format standardizes how these images should be structured and stored.

**Key Concepts:**

- **Layers**: A container image consists of layers that represent filesystem changes. Each layer can be reused across images, which helps save space.
- **Config**: This contains metadata about the image (e.g., environment variables, working directory, entrypoint).
- **Manifest**: A JSON file that describes the image, including its layers, config, and other metadata.
- **Distribution**: The way the image is stored and shared, typically via container registries (e.g., Docker Hub, Google Container Registry).

##### **How the OCI Image Format Works:**

1. **Image Layers**: The image is made up of several layers stacked on top of each other. Each layer represents a set of changes to the filesystem (e.g., installing a package, adding a file).
2. **Root Filesystem**: The root filesystem of the image contains the system libraries and binaries required to run the application.
3. **Configuration Files**: The configuration (like environment variables, volumes, entry points) defines how the image will behave when it is run as a container
