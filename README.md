# Uni Tübingen Latex Template (based of the Tufte Template)
![title page](./assets/overviewpages.png)

This template for a thesis is base on the [tufte-latex](https://github.com/Tufte-LaTeX/tufte-latex) template by [Kevin Godby](https://github.com/godbyk), [Bil Kleb](https://github.com/kleb), and Bill Wood. I changed the folder structure a bit and added a personal touch.

## Structure of the template
 - `./thesis.tex` is the main document. Here you can add chapter files (line 55 ff.)
 - `./biblography.bib` is the bib file for the project
 - `./compile.ps1` is a PowerShell script to compile the hole document
 - `./appendix/*` folder that holds the appendix and its parts
    - `./appendix/Appendix.tex` the main document that lists all the appendices
    - `./appendix/pars/*` folder that was created to make the appendix a bit more readable. Here you can create parts that are then in the appendix
 - `./chapters/*` folder to incorporate the chapters of the thesis
 - `./figures/*` is the default folder for all figures and images
 - `./includes/*` definitions and packages
    - `./includes/definitions.tex` some definitions by the template that are expanded by personal definitions and commands
    - `./includes/packages.tex` list of packages that are used by the template
 - `./pages/*` some basic pages
    - `./pages/titlepage.tex` the title page of the document
    - `./pages/Abbreviations.tex` a list of acronyms using the `acronym` package
    - `./pages/Abstract.tex` the abstract of the thesis
    - `./pages/Selbständigkeitserklärng.tex` Selbständigkeitserklärung for submitting the thesis (this is the last page in the document)

## Settings
To set recurring constants, such as author, title, etc., please simply adjust the respective entry in [`./includes/definitions.tex`](./includes/definitions.tex) (line 142 ff.).

## Custom Commands
- `\chapterref{<linkname>}`: Command that writes out as `Chapter <reference number>`.
- `\figref{<linkname>}`: Command that writes out as `Figure <reference number>`.
- `\tabref{<linkname>}`: Command that writes out as `Table <reference number>`.
- `\appref{<linkname>}`: Command that writes out as `Appendix <reference number>`.
- `\coderef{<linkname>}`: Command that writes out as `Code <reference number>`.
- `\appsection{<title>}`: Title of chapter in appendix.



## Compile
The template can be build by using the [`./compile.ps1`](./compile.ps1) file.
Just ran on Linux
```shell
pwsh ./compile.ps1
```
and on Windows
```powershell
./compile.ps1
```