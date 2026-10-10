# CAEPPF – LaTeX source (Elsevier CAS double-column, TRIPOD+AI structure)

**A Comparative Machine Learning Framework for Predicting Childhood Pneumonia Prevalence: Integrating Household Crowding, Vaccination Status, and Passive Smoking as Socio-Environmental Determinants**

Md Artad Chowdhury, Bishal Paul (corresponding: paulvishal70@gmail.com), Md. Asif Mredha, Shafiul Alam Faysal

## Contents

```
CAEPPF_latex/
├── main.tex      # the whole paper: title, authors, graphical abstract, highlights,
│                 # abstract, keywords, body, tables, equations, TRIPOD+AI checklist, references
├── cas-dc.cls    # LOCAL PREVIEW STAND-IN for Elsevier's cas-dc class (see below)
├── figures/      # fig01.png … fig18.png, graphical_abstract.png / .svg
└── README.md
```

Everything is in `main.tex` (single file, bibliography included as `thebibliography`; no BibTeX run needed).
Abstract: search for `\begin{abstract}` (near line 44). Highlights: `\begin{highlights}`.

## Compile

```
pdflatex main.tex
pdflatex main.tex
pdflatex main.tex     # three passes resolve references
```

Requires a standard TeX Live with: mathptmx, amsmath, amssymb, enumitem, natbib, caption, booktabs, hyperref, graphicx.
Output: A4, two columns, Graphical Abstract page and Highlights page first, then the article (about 25 pages).

## Submitting to the journal

`cas-dc.cls` here is only a stand-in written so the paper compiles offline with the same look.
For submission, delete it and use Elsevier's official `cas-dc.cls` (with `cas-common.sty`, `cas-model2-names.bst` if you switch to BibTeX); `main.tex` is written with that class's commands (`\title[mode=title]`, `\author`, `\affiliation`, `graphicalabstract`, `highlights`, `keywords` with `\sep`).

## Paper structure (TRIPOD+AI)

1. Introduction (background and existing models, target population and users, health inequalities, objectives)
2. Methods (study type, ethics, setting, sample size, predictors, pipeline, 11 algorithms, tuning, nested CV, evaluation, calibration, DCA, ablation, CERS, CHW model/CPSS, SHAP, fairness, sensitivity, model output, software)
3. Open science and patient and public involvement
4. Results
5. Discussion (interpretation, comparison with literature, limitations, intended use)
6. Conclusion
- End matter: CRediT, competing interests, acknowledgments, TRIPOD+AI checklist table (Table 17), references.

## Before submission – items to complete

- **Funding statement** (Section 3): placeholder in brackets.
- **Data accrual start/end dates** (Methods, "Study setting, participants and study period"): placeholder in brackets; take from the data descriptor (Tligui et al.).
- Confirm "not registered / no protocol / no patient and public involvement" statements.
- Confirm the CRediT roles for each author.
- Replace `cas-dc.cls` with the official class.

## Data and code

- Dataset: Mendeley Data, DOI 10.17632/2d9dvnycjw.1 (CC BY 4.0), Children's Hospital of Rabat, Morocco.
- Analysis notebook `Pneumonia_ML_Pipeline.ipynb`, result tables, figures and run log: Supporting Information (S1 File).
- Global seed 42 (split, tuning folds, SMOTE, classifiers); seed 43 for the nested-CV outer folds.

## Note on editing

`main.tex` was edited by hand after generation from the revised manuscript (.docx). Do not regenerate it from the converter script, or the CRediT, TRIPOD+AI and structure edits will be overwritten.
