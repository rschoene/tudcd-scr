# How to Contribute

Vielen lieben Dank für Ihren Beitrag zu `tudcd-scr`! Ich weiß es sehr zu schätzen.

Um Ihren Codebeitrag in das Hauptrepository zu bekommen, befolgen Sie bitte den [Git Workflow](#git-workflow)

Sollten Sie Fragen zur Implementierung haben, finden Sie ein paar Ressourcen in [diesem Kapitel](#latex-resource)

---

Thank you for contributing to `tudcd-scr`! I gladly appreciate it.

In order to get your contribution into the main codebase, please follow the [Git Workflow](#git-workflow).

If you have questions regarding the implementation side, a couple resources have been linked
in [this chapter](#latex-resource)

## Git Workflow

* **Fork** this Repository
* **Push** your changes to your fork on some branch.
* Open a **merge request** using the branch you pushed your changes
  to as the source branch and the main of the core module repository
  as the target branch. Github will usually ask you about opening
  a merge request if you browse it right after pushing to some branch.
* Follow the discussion on the merge request to see what improvements
  should be done to the branch before merging.

## LaTeX Resource

* Build System
  * Documentation for [`l3build`](https://ctan.org/pkg/l3build)
  * Documentation for [`docstrip`](https://ctan.org/pkg/docstrip)
* LaTeX Implementation
  * Basics
    * The [`clsguide`](https://ctan.org/pkg/clsguide)
    * The [`usrguide`](https://ctan.org/pkg/usrguide)
    * The LaTeX3 Interface `interface3`, via `texdoc interface3`
    * The Hooks Mechanism `lthooks`, via `texdoc lthooks`
    * The Sockets and Plugs Mechanism `tlsockets`, via `texdoc ltsockets`
    * The Template Mechanism `lttemplates`, via `texdoc lttemplates`
  * Font Settings
    * The [`fntguide`](https://ctan.org/pkg/fntguide)
    * The package [`fontspec`](https://ctan.org/pkg/fontspec)
  * Presentations
    * The [`beamer`](https://ctan.org/pkg/beamer) class
    * The [`ltx-talk`](https://ctan.org/pkg/ltx-talk) class
  * Poster
    * The [`textpos`](https://ctan.org/pkg/textpos) package