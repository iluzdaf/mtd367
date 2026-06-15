# MTD 367 iOS Application Development

This is the public-facing repository for MTD 367 iOS Application Development at SUSS. It contains student-facing lesson materials, slide exports, review notes, and Swift/iOS example code.

Private assessment materials are intentionally not stored here. TMA/ECA questions, marking guides, rubrics, model answers, and private course-planning documents should live in restricted Google Docs/Drive folders only.

## Repository Layout

```text
years/
  2025/
    lesson_01/
      slides/
      code/
    reviews/
  2026/
    lesson_01/
      slides/
        README.md
        exports/
      code/
docs/
```

## Current Materials

- `years/2025/` contains the archived 2025 public lesson materials.
- `years/2025/reviews/` contains post-submission review material that is safe for students to read after submission.
- `years/2026/` is the working area for the next course run.

## Slides

For 2026 onward, Canva is the source of truth for slides.

Each lesson should keep slide metadata and links in:

```text
years/2026/lesson_nn/slides/README.md
```

Student-facing slide exports should go in:

```text
years/2026/lesson_nn/slides/exports/
```

Exports may include PDF or HTML files when they are useful for students. Do not add private Canva links or assessment-only slide content to this repository.

## Code

Lesson code belongs with the matching lesson:

```text
years/2026/lesson_nn/code/
```

Use Swift Playgrounds or Xcode projects as appropriate for the lesson. Avoid committing local Xcode user files or build artifacts.

## Private Assessment Context

Assessment context should be kept in restricted Google Docs/Drive folders, not in this repo. See [docs/private-context-workflow.md](docs/private-context-workflow.md) for the workflow.

Codex or other AI assistants may use private assessment documents only when explicitly asked to design assessment-aligned public materials. Public outputs must be sanitized and must not reproduce private assessment text.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
