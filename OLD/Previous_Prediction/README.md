# CAEPPF: Community-Aware Explainable Pneumonia Prediction Framework

A machine learning framework for predicting childhood pneumonia risk from clinical, demographic, socio-environmental, and vaccination data — built on a 799-patient pediatric cohort from Rabat, Morocco.

---

## 📁 Files in This Project

| File | Description |
|---|---|
| **`IEEE_Pneumonia_CAEPPF_MaxAccuracy.docx`** | ⭐ **Final, most complete paper.** IEEE-format manuscript (20 pages) including feature ablation, CERS, calibration, DCA, DeLong/McNemar tests, fairness analysis, SHAP, and the maximum-accuracy optimization phase (88.13% accuracy). **Use this version.** |
| `IEEE_Pneumonia_CAEPPF_Final.docx` | Earlier draft — same framework, without the final accuracy-optimization section. Kept for reference. |
| `IEEE_Pneumonia_Paper_Final.docx` | Earlier draft — real-data results, before CAEPPF naming/framework consolidation. |
| `IEEE_Pneumonia_Paper_Revised.docx` | Early draft — first pass with real dataset results (10 baseline features). |
| `IEEE_Pneumonia_Paper_Version2.docx` | Original structural rewrite — used placeholder/illustrative numbers, superseded by later versions. |
| `Paper_Review_Feedback.pdf` | Initial peer-review-style critique of the original manuscript (gaps, lack of validation, dataset inconsistency, etc.) |
| `Clinical_Decision_Framework.png` | Standalone high-res diagram of the 5-step CHW clinical decision workflow (also embedded in the paper as Fig. 8). |
| `Pneumonia_ML_Pipeline.ipynb` | Runnable Jupyter notebook — feature engineering, 11-model benchmarking, SMOTE, statistical tests, SHAP, and all core figures. |
| `BD_IRA.xlsx` | Source dataset (801 pediatric patients, copied here so the notebook runs standalone). |

---

## 🏆 Headline Results

| Metric | Result |
|---|---|
| Best test accuracy | **88.13%** (XGBoost, Optuna-tuned, threshold = 0.77) |
| Best test AUC-ROC | **0.886** (CatBoost / XGBoost, tied) |
| Best cross-validated AUC (most stable) | **0.880 ± 0.033** (Random Forest, Optuna-tuned) |
| Socio-environmental feature contribution | **+1.8 AUC points** over clinical-only baseline (ablation study) |
| Best-calibrated model | Random Forest (Brier = 0.109, ECE = 0.052) |
| Fairness (AUC range across subgroups) | 0.846 – 0.962 (no catastrophic failure) |

---

## 🧪 Methodology Summary

1. **Dataset**: 799 children (Rabat, Morocco), 27.3% pneumonia-positive, sourced from a public Mendeley dataset (CC BY 4.0).
2. **Feature engineering**: 28 base features (clinical, demographic, socio-environmental, vaccination) → expanded to 45 with interaction terms, log-transforms, and composite risk scores for the final optimization phase.
3. **Class imbalance**: SMOTE / SMOTETomek applied strictly within cross-validation training folds — never leaked into test data.
4. **Preprocessing**: StandardScaler / RobustScaler fit only on training data (leakage-free).
5. **Models**: 11 baseline algorithms (Logistic Regression → MLP) plus Optuna-tuned XGBoost, LightGBM, Random Forest, and CatBoost.
6. **Validation**: Stratified 5-fold CV, DeLong & McNemar statistical tests, calibration analysis, Decision Curve Analysis, fairness/subgroup analysis, and 10-seed sensitivity analysis.
7. **Interpretability**: Random Forest Gini importance (individual + grouped) and SHAP (summary, dependence, and waterfall plots).
8. **Novel contributions**: Feature ablation study, Community Exposure Risk Score (CERS, expert + data-driven weights), Community Pneumonia Screening Score (CPSS), and a 5-step Clinical Decision Framework for community health workers.

---

## ▶️ How to Reproduce

1. Open `Pneumonia_ML_Pipeline.ipynb` in Jupyter.
2. Ensure `BD_IRA.xlsx` is in the same folder.
3. Run all cells top to bottom — it will install dependencies, engineer features, train all models, run statistical tests, and regenerate all figures into a local `figs/` folder.

---

## ⚠️ Known Limitations (see paper Section V for full list)

- Single-site dataset (Morocco only) — external multi-site validation not yet performed.
- CERS optimized weights derived on the same data used for evaluation (risk of optimism).
- CPSS and accuracy-optimal thresholds have not been prospectively validated.
- Ensembling/stacking did not outperform tuned single models — likely a sample-size effect (n=799).

---

## 📚 Citation / Data Source

Tligui, H., Hattoufi, K., Jroundi, I., Mahraoui, C., & Bassat, Q. (2024). *Pediatric Respiratory Infections: Epidemiological and Etiological Data from a Cohort of 801 Moroccan Children.* Mendeley Data, V1. https://doi.org/10.17632/2d9dvnycjw.1 (CC BY 4.0)
