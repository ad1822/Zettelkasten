---
cssclasses:
  - center-images
  - center-titles
---
Tags:  #docker

# Best Practices

### Use multi-stage Builds
- Multi-stage builds let you reduce the size of your final image, by creating a cleaner separation between the building of your image and the final output. Split your Dockerfile instructions into distinct stages to make sure that the resulting output only contains the files that are needed to run this application.
- Using multiple stages can also let you build more efficiently by executing build steps in parallel.

### Create reusable stages
- If you have multiple images with a lot in common, consider creating a reusable stage that includes the shared components, and basing your unique stages on that. Docker only needs to build the common stage once. This means that your derivative images use memory on the Docker host more efficiently and load more quickly.

- It's also easier to maintain a common base stage (`Don't repeat yourself`), than it is to have multiple different stages doing similar things

### Chose the right base image
- The first step towards achieving a secure image is to choose the right base image. When choosing an image, ensure it's built from a trusted source and keep it small.
- You should also consider using two types of base image: one for building and unit testing, and another (typically slimmer) image for production. In the later stages of development, your image may not require build tools such as compilers, build systems, and debugging tools. A small image with minimal dependencies can considerably lower the attack surface.
