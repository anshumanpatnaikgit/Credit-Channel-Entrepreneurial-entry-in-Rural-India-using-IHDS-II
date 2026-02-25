# Credit Channels, Social Networks, and Entrepreneurial Entry  
## A Structural Study Using IHDS-II Data

---

## 1. Scope of the Research

This project investigates the structural role of credit in shaping household economic behavior in rural India. Specifically, it asks:

- Does credit function as productive capital?
- Does it primarily serve as liquidity insurance?
- Or does its impact depend on institutional form?

The study focuses on **entrepreneurial entry into non-farm business activity**, treating entry as a capital-intensive decision subject to liquidity constraints.

Rather than treating credit as homogeneous, the project distinguishes between:

- **Formal institutional credit**
- **Informal market-based credit**
- **Informal relationship-based credit**

The scope is therefore not merely access to finance, but the **institutional structure of finance**.

---

## 2. Motivation

In developing economies:

- Entry into enterprise often involves fixed or indivisible startup costs.
- Households face risk, shocks, and incomplete insurance markets.
- Credit markets are segmented and socially embedded.

Standard models assume:
     Credit → Investment → Enterprise


However, in financially dualistic environments, credit may:

- Relax capital constraints
- Smooth consumption
- Reinforce dependency structures

This research aims to separate these mechanisms causally.

---

## 3. Data Source

- **India Human Development Survey (IHDS-II)**
- Rural household-level data
- Weighted to maintain national representativeness

The dataset contains:

- Loan source and amount information
- Business ownership indicators
- Household assets and demographics
- Social network variables
- Shock exposure
- Village identifiers

---

## 4. Conceptual Framework

The project is built around three structural ideas:

### 1. Indivisibility of Entry Costs
Entrepreneurial entry requires a minimum capital threshold.

### 2. Financial Dualism
Credit markets differ by institutional form and enforcement mechanism.

### 3. Social Embeddedness
Credit access is mediated by caste-based and village-level networks.

These ideas guide both variable construction and identification.

---

## 5. Identification Strategy Overview

Credit access is endogenous due to:

- Reverse causality
- Omitted entrepreneurial ability
- Wealth and network selection

To address this, the project implements a:

## Split-Instrumental Variable Strategy

**Instrument:**  
Caste-based network credit density within village–caste cells.

For each credit channel, an instrument is constructed as:

  Peer prevalence excluding self


This design:

- Leverages within-network variation
- Avoids mechanical self-correlation
- Allows separate identification of credit types

The strategy is implemented independently for:

- Formal access
- Predatory informal liquidity
- Social informal liquidity

---

## 6. What the Code Implements

The Stata `.do` file performs the following structured workflow.

---

### SECTION A: Data Cleaning & Standardization

- Renames raw IHDS variable codes into readable economic variables
- Removes missing or invalid entries
- Creates consistent binary indicators
- Ensures compatibility with weighted estimation

This section prepares the dataset for structural analysis.

---

### SECTION B: Credit Taxonomy Construction

The code separates credit into institutional categories:

#### Formal Credit
Institutional lenders such as:
- Banks
- Cooperatives
- Government programs

#### Informal Credit

Split into:

**Predatory (market-enforced)**
- Moneylenders
- Employers

**Social (relationship-enforced)**
- Friends
- Relatives

Log transformations are applied to liquidity variables to reduce skewness.

---

### SECTION C: Wealth Index Construction

Instead of raw asset counts, the project uses:

**Principal Component Analysis (PCA)**

Steps:

1. Select durable asset indicators
2. Run PCA
3. Construct weighted asset index
4. Standardize for interpretation

This ensures:

- Reduced arbitrariness
- Alignment with standard development-economics practice

---

### SECTION D: Control Variables

The code constructs and integrates:

- Demographics (age, education, household size)
- Dependency ratios
- Regional fixed effects
- Shock exposure indicators
- Village infrastructure controls
- Social capital network measures

Controls are grouped logically to maintain transparency.

---

### SECTION E: Instrument Construction

Key technical details:

- Data sorted by village and caste identifiers
- Group-level totals computed
- Self-exclusion applied
- Instruments normalized by group size

Separate instruments are created for each credit channel.

This section is central to causal identification.

---

### SECTION F: Econometric Models

The following estimation frameworks are implemented:

#### 1. IV-Probit
Used when:
- Dependent variable is binary
- Regressor is endogenous

#### 2. Two-Stage Least Squares (2SLS)
Used for:
- Continuous endogenous liquidity measures

Each credit type is estimated in separate structural models.

The structure allows direct comparison across institutional forms.

---

### SECTION G: Diagnostic & Validation Components

The code includes:

- First-stage strength checks
- Interaction models (e.g., wealth heterogeneity)
- Subsample splits (e.g., gender)
- Binscatter visualizations

These components help verify identification assumptions and explore structural heterogeneity.

---

## 7. File Organization Logic

The `.do` file is organized sequentially:

1. Install dependencies
2. Rename variables
3. Generate credit categories
4. Construct wealth index
5. Create control vectors
6. Construct instruments
7. Estimate models
8. Generate diagnostics
9. Export figures

The structure is modular — sections can be run independently once prior variables exist.

---

## 8. Required Stata Packages

The following external packages are used:

- `binscatter`
- `coefplot`
- `estout`

Install via:

```stata
ssc install binscatter, replace
ssc install coefplot, replace
ssc install estout, replace
```
## 9. Assumptions Embedded in the Design

The empirical design relies on the following identifying assumptions:

### Relevance  
Network density predicts individual credit access.

### Exclusion  
Peer borrowing affects entrepreneurship only through access to credit.

### Stable Village–Caste Group Structure  
Networks are locally bounded and structurally stable within village–caste cells.

### No Reflection Bias  
The individual household is excluded from group averages when constructing instruments.

These conditions are operationalized directly in the instrument construction section of the code.

---

## 10. How to Familiarize Yourself With the Code

Recommended reading order:

### Step 1  
Read the renaming section carefully to understand the mapping from IHDS variable codes to economic variables.

### Step 2  
Examine how credit channels are constructed and categorized.

### Step 3  
Trace the instrument construction process line by line, paying close attention to sorting and self-exclusion.

### Step 4  
Run first-stage models before estimating second-stage specifications.

### Step 5  
Inspect interaction and heterogeneity sections to understand structural extensions.

To follow execution flow in detail, use:

```stata
set trace on
```
This allows step-by-step debugging and command tracking.

## 11. Intended Contribution of This Repository

This repository provides:

- A structured causal design  
- A transparent split-instrumental variable (Split-IV) implementation  
- A reproducible credit taxonomy  
- A modular econometric workflow  

It is intended for:

- Development economists  
- Applied micro researchers  
- Students learning instrumental variable methods  
- Policy researchers examining financial dualism  

The goal is to offer a clean, well-documented empirical framework that can be replicated, audited, and extended.

---

## 12. Important Notes for Users

Please review the following before running the code:

- Do **not** alter sorting before `by` commands. Instrument construction depends on correct ordering.  
- Ensure sampling weights are applied in all regressions.  
- Run PCA before constructing any wealth interaction terms.  
- Verify group sizes prior to instrument normalization.  
- Always examine first-stage strength before interpreting second-stage estimates.  

Failure to follow these steps may invalidate identification.

---

## 13. Ethical & Analytical Boundaries

This study does **not**:

- Assume all informal finance is harmful  
- Assume formal finance is universally accessible  
- Treat credit markets as frictionless  

Instead, it evaluates institutional differentiation within existing rural financial structures, recognizing heterogeneity in enforcement, access, and economic function.


