<h1 align="center">
  LaTeX resume template
</h1>

<hr>

<p align="center">
  <a href="#">Overleaf</a> •
  <a href="#note">Note</a> •
  <a href="#about">About</a> •
  <a href="#description">Description</a> •
  <a href="#local-build">Local build</a> •
  <a href="#preview">Preview</a> •
  <a href="#license">License</a>
</p>

### TODO (before publish):

- [ ] Fill in README sections
- [ ] Add preview image
- [ ] Add new sections in resume (education, projects)
- [ ] Add fake data in resume
- [x] Some info about template
- [x] Add just commands
- [x] Add help command for justfile
- [x] Add CI for building pdf


## Note
This LaTeX template is a reworked version of [Jake Gutierrez](https://github.com/jakegut) 
template which available on GitHub by [link](https://github.com/jakegut/resume).
The original template is licensed under [MIT License](https://github.com/jakegut/resume/blob/master/LICENSE).

## Description
Yet another simple, clean and ATS friendly resume template with module structure.
Also available local building from tex to pdf use docker 
and simple CI pipline which build pdf on github actions.

## Local build
Show available just commands
```bash
just help
```

<details>
<summary>Useful commands</summary>

Build images
```bash
just build
```

Convert .tex to pdf
```bash
just run
```

Formatting .tex files and build pdf
```bash
just run-format
```

Remove all .bak files
```bash
just remove-bak
```

Run LaTeX linter
```bash
just run-linter
```
</details>


## Preview

## License
This project is licensed under the MIT License. For more details see file [LICENSE](./LICENSE).

<br>
<p align="center">
  <a href="https://github.com/mrKazzila">GitHub</a> •
  <a href="https://mrkazzila.github.io/resume/">Resume</a> •
  <a href="https://www.linkedin.com/in/i-kazakov/">LinkedIn</a>
</p>
