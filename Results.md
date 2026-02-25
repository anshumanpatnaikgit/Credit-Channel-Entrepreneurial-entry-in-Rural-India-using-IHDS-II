# Results Section  
## Formal Credit Model (Men: Head Sex = 1)

This section reports the structural IV-Probit results for male-headed households.  
Users should compare their output directly against the values below to confirm correct execution.

---

## 1. Model Summary

- Estimation Method: IV-Probit  
- Endogenous Variable: `has_formal_access`  
- Instruments: `iv_formal_prev`, `bank_proximity`  
- Observations: **22,985**  
- Wald χ²(27): **666.10**  
- Prob > χ²: **0.0000**

---

## 2. Main Coefficient of Interest

### Formal Credit Access

| Variable              | Coef.   | Std. Err. | z     | P>|z| |
|----------------------|---------|-----------|-------|------|
| has_formal_access    | 0.5611  | 0.1850    | 3.03  | 0.002 |

**Interpretation:**  
Formal credit access has a positive and statistically significant effect on non-farm entrepreneurial entry among male-headed households.

Users should verify:

- Coefficient ≈ **0.561**
- Standard error ≈ **0.185**
- Significance at 1% level

---

## 3. Key Control Variables

### Wealth & Assets

| Variable                | Coef.   | P>|z| |
|-------------------------|---------|------|
| wealth_index_pca        | 0.0177  | 0.000 |
| fixed_deposits_at_bank  | 0.1030  | 0.053 |
| Owned_farm_land         | -0.4059 | 0.000 |

---

### Household Characteristics

| Variable          | Coef.  | P>|z| |
|------------------|--------|------|
| max_education_hh | 0.0119 | 0.032 |
| NPERSONS         | 0.0405 | 0.000 |
| adult_age_sq     | NS     | 0.711 |

---

### Regional Effects (Relative to Base Region)

- Eastern India: **Positive and significant**
- Central India: **Positive and significant**
- Western India: **Negative and significant**
- Southern India: **Negative and significant**
- North-East: Not significant

---

### Social & Network Variables

| Variable                     | Effect |
|-----------------------------|--------|
| member_union_bus_group      | Positive & significant |
| panchayat_member_hh         | Positive & significant |
| member_mahila_mandal        | Negative & significant |
| member_self_help_group      | Negative & significant |
| experienced_untouchability  | Negative & significant |

---

### Shock Variables

| Variable              | Effect |
|----------------------|--------|
| village_shock_health | Positive & significant |
| village_crop_fail    | Negative & significant |

---

## 4. Endogeneity Test

Wald test of exogeneity:

- χ²(1) = **5.61**
- Prob > χ² = **0.0178**

Since p < 0.05, the null of exogeneity is rejected.  
This confirms that IV estimation is necessary.

---

## 5. Structural Parameters

| Parameter | Value  |
|-----------|--------|
| rho       | -0.1868 |
| sigma     | 0.3982  |

- rho significantly different from zero  
- Indicates correlation between error terms  

---

# Validation Checklist

Your output should match:

- Observations: **22,985**
- has_formal_access coefficient ≈ **0.56**
- Significant at **1%**
- Wald exogeneity test p ≈ **0.018**
- rho negative and significant

If these values differ materially:

- Check instrument construction
- Verify sorting before `by` commands
- Confirm weights are applied
- Ensure correct subsample restriction
- Confirm `bank_proximity` is included as instrument

This section serves as the benchmark replication output for the formal credit model (men).

# Results Section  
## Formal Credit Model (Women: Head Sex = 2)

---

## 1. Model Summary

- Estimation Method: IV-Probit  
- Endogenous Variable: `has_formal_access`  
- Instruments: `iv_formal_prev`, `bank_proximity`  
- Observations: **3,793**  
- Wald χ²(27): **165.09**  
- Prob > χ²: **0.0000**

---

## 2. Main Coefficient of Interest

### Formal Credit Access

| Variable              | Coef.   | Std. Err. | z     | P>|z| |
|----------------------|---------|-----------|-------|------|
| has_formal_access    | 0.4288  | 0.6576    | 0.65  | 0.514 |

**Result:** Not statistically significant.

---

## 3. Endogeneity Test

- Wald test of exogeneity: χ²(1) = **0.00**  
- Prob > χ² = **0.9996**

**Conclusion:** Cannot reject exogeneity. IV not required for women subsample.

---

# INFORMAL CREDIT — PREDATORY CHANNEL

---

## Model 1: Business Entry

Dependent Variable: `Nonfarm_business`  
Observations: **26,907**  
Wald χ²(23): **743.34**

| Variable                | Coef.      | Std. Err. | P>|z| |
|------------------------|-----------|-----------|------|
| l_predatory_liquidity  | -0.01260  | 0.00390   | 0.001 |

**Effect:** Negative and significant.

---

## Model 2: Consumption

Dependent Variable: `l_copc`  
Observations: **26,787**  
Wald χ²(21): **7428.57**

| Variable                | Coef.      | Std. Err. | P>|z| |
|------------------------|-----------|-----------|------|
| l_predatory_liquidity  | -0.00438  | 0.00618   | 0.478 |

**Effect:** Not significant.

---

## Model 3: Debt Trap

Dependent Variable: `l_outstanding_debt`  
Observations: **24,833**  
Wald χ²(24): **2554.66**

| Variable                | Coef.      | Std. Err. | P>|z| |
|------------------------|-----------|-----------|------|
| l_predatory_liquidity  | 0.58833   | 0.05462   | 0.000 |

**Effect:** Large positive and highly significant.

---

# INFORMAL CREDIT — SOCIAL CHANNEL

---

## Model 1S: Business Entry

Dependent Variable: `Nonfarm_business`  
Observations: **26,907**  
Wald χ²(23): **750.63**

| Variable              | Coef.    | Std. Err. | P>|z| |
|----------------------|----------|-----------|------|
| l_social_liquidity   | 0.02101  | 0.00538   | 0.000 |

**Effect:** Positive and significant.

---

## Model 2S: Consumption

Dependent Variable: `l_copc`  
Observations: **26,787**  
Wald χ²(21): **7359.44**

| Variable              | Coef.    | Std. Err. | P>|z| |
|----------------------|----------|-----------|------|
| l_social_liquidity   | 0.01848  | 0.00768   | 0.016 |

**Effect:** Positive and significant.

---

## Model 3S: Debt

Dependent Variable: `l_outstanding_debt`  
Observations: **24,833**  
Wald χ²(24): **2629.66**

| Variable              | Coef.    | Std. Err. | P>|z| |
|----------------------|----------|-----------|------|
| l_social_liquidity   | 0.40092  | 0.06089   | 0.000 |

**Effect:** Positive and significant.

---

# Structural Summary

### Formal Credit (Women)
- No statistically significant effect on entrepreneurial entry.
- No evidence of endogeneity.

### Predatory Informal Credit
- Reduces business entry.
- No consumption smoothing effect.
- Strongly increases outstanding debt.

### Social Informal Credit
- Increases business entry.
- Improves consumption.
- Increases debt, but magnitude lower than predatory channel.

---

# Validation Benchmarks

Women Formal Model:
- has_formal_access ≈ 0.4288 (NS)
- Exogeneity p ≈ 0.9996

Predatory Business:
- ≈ -0.0126 (p=0.001)

Predatory Debt:
- ≈ 0.5883 (p=0.000)

Social Business:
- ≈ 0.0210 (p=0.000)

Social Debt:
- ≈ 0.4009 (p=0.000)
