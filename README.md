Credit Channels, Social Networks, and Entrepreneurial Entry
A Structural Study Using IHDS-II Data
1. Scope of the Research

This project investigates the structural role of credit in shaping household economic behavior in rural India. Specifically, it asks:

Does credit function as productive capital?

Does it primarily serve as liquidity insurance?

Or does its impact depend on institutional form?

The study focuses on entrepreneurial entry into non-farm business activity, treating entry as a capital-intensive decision subject to liquidity constraints.

Rather than treating credit as homogeneous, the project distinguishes between:

Formal institutional credit

Informal market-based credit

Informal relationship-based credit

The scope is therefore not merely access to finance, but the institutional structure of finance.

2. Motivation

In developing economies:

Entry into enterprise often involves fixed or indivisible startup costs.

Households face risk, shocks, and incomplete insurance markets.

Credit markets are segmented and socially embedded.

Standard models assume:

𝐶
𝑟
𝑒
𝑑
𝑖
𝑡
→
𝐼
𝑛
𝑣
𝑒
𝑠
𝑡
𝑚
𝑒
𝑛
𝑡
→
𝐸
𝑛
𝑡
𝑒
𝑟
𝑝
𝑟
𝑖
𝑠
𝑒
Credit→Investment→Enterprise

However, in financially dualistic environments, credit may:

Relax capital constraints

Smooth consumption

Reinforce dependency structures

This research aims to separate these mechanisms causally.

3. Data Source

India Human Development Survey (IHDS-II)

Rural household-level data

Weighted to maintain national representativeness

The dataset contains:

Loan source and amount information

Business ownership indicators

Household assets and demographics

Social network variables

Shock exposure

Village identifiers

4. Conceptual Framework

The project is built around three structural ideas:

1. Indivisibility of Entry Costs

Entrepreneurial entry requires a minimum capital threshold.

2. Financial Dualism

Credit markets differ by institutional form and enforcement mechanism.

3. Social Embeddedness

Credit access is mediated by caste-based and village-level networks.

These ideas guide both variable construction and identification.

5. Identification Strategy Overview

Credit access is endogenous due to:

Reverse causality

Omitted entrepreneurial ability

Wealth and network selection

To address this, the project implements a:

Split-Instrumental Variable Strategy

Instrument:
Caste-based network credit density within village–caste cells.

For each credit channel, an instrument is constructed as:

Peer prevalence excluding self
Peer prevalence excluding self

This design:

Leverages within-network variation

Avoids mechanical self-correlation

Allows separate identification of credit types

The strategy is implemented independently for:

Formal access

Predatory informal liquidity

Social informal liquidity

6. What the Code Implements

The Stata file performs the following structured workflow.

SECTION A: Data Cleaning & Standardization

Renames raw IHDS variable codes into readable economic variables

Removes missing or invalid entries

Creates consistent binary indicators

Ensures compatibility with weighted estimation

This section prepares the dataset for structural analysis.

SECTION B: Credit Taxonomy Construction

The code separates credit into institutional categories:

Formal Credit

Institutional lenders such as:

Banks

Cooperatives

Government programs

Informal Credit

Split into:

Predatory (market-enforced)

Moneylenders

Employers

Social (relationship-enforced)

Friends

Relatives

Log transformations are applied to liquidity variables to reduce skewness.

SECTION C: Wealth Index Construction

Instead of raw asset counts, the project uses:

Principal Component Analysis (PCA)

Steps:

Select durable asset indicators

Run PCA

Construct weighted asset index

Standardize for interpretation

This ensures:

Reduced arbitrariness

Standard development-economics practice

SECTION D: Control Variables

The code constructs and integrates:

Demographics (age, education, household size)

Dependency ratios

Regional fixed effects

Shock exposure indicators

Village infrastructure controls

Social capital network measures

Controls are grouped logically to maintain transparency.

SECTION E: Instrument Construction

Key technical details:

Data sorted by village and caste identifiers

Group-level totals computed

Self-exclusion applied

Instruments normalized by group size

Separate instruments are created for each credit channel.

This section is central to causal identification.

SECTION F: Econometric Models

The following estimation frameworks are implemented:

1. IV-Probit

Used when:

Dependent variable is binary

Regressor is endogenous

2. Two-Stage Least Squares (2SLS)

Used for:

Continuous endogenous liquidity measures

Each credit type is estimated in separate structural models.

The structure allows direct comparison across institutional forms.

SECTION G: Diagnostic & Validation Components

The code includes:

First-stage strength checks

Interaction models (e.g., wealth heterogeneity)

Subsample splits (e.g., gender)

Binscatter visualizations

These components help verify identification assumptions and explore structural heterogeneity.

7. File Organization Logic

The .do file is organized sequentially:

Install dependencies

Rename variables

Generate credit categories

Construct wealth index

Create control vectors

Construct instruments

Estimate models

Generate diagnostics

Export figures

The structure is modular — sections can be run independently once prior variables exist.

8. Required Stata Packages

The following external packages are used:

binscatter

coefplot

estout

Install via:

ssc install binscatter, replace
ssc install coefplot, replace
ssc install estout, replace
9. Assumptions Embedded in the Design

The empirical design relies on:

Relevance:
Network density predicts individual credit access.

Exclusion:
Peer borrowing affects entrepreneurship only through access.

Stable village–caste group structure:
Networks are locally bounded.

No reflection bias:
Self is excluded from group averages.

These are implicitly enforced in instrument construction.

10. How to Familiarize Yourself With the Code

Recommended reading order:

Step 1

Read renaming section carefully to understand variable mapping.

Step 2

Examine how credit channels are constructed.

Step 3

Trace instrument construction line by line.

Step 4

Run first-stage models before second-stage estimation.

Step 5

Inspect interaction and heterogeneity sections.

To understand logic fully, use:

set trace on

for debugging and flow tracking.

11. Intended Contribution of This Repository

This repository provides:

A structured causal design

A transparent split-IV implementation

A reproducible credit taxonomy

A modular econometric workflow

It is intended for:

Development economists

Applied micro researchers

Students learning IV methods

Policy researchers examining financial dualism

12. Important Notes for Users

Do not alter sorting before by commands.

Ensure weights are applied in regressions.

Run PCA before constructing wealth interactions.

Verify group sizes before instrument normalization.

Always check first-stage strength before interpretation.

13. Ethical & Analytical Boundaries

This study does not:

Assume all informal finance is harmful

Assume formal finance is universally accessible

Treat credit markets as frictionless

Instead, it evaluates institutional differentiation within existing rural financial structures.
