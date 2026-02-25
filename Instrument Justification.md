# Instrument Justification Framework

This document provides the theoretical and empirical foundations for the instrumental variable strategy used in this repository. The instruments exploit variation in caste-network level credit exposure to identify differential access to **formal** and **informal** finance.

The justification draws from established literature in development economics, credit market theory, and network economics.

---

# I. Formal Loan Instrument

The formal loan instrument is grounded in three complementary mechanisms documented in the literature:

- Cultural proximity  
- Information diffusion  
- Social collateral and network dominance  

---

## A. The “Cultural Proximity” Channel  
### (Direct Match with Bank Officers)

**Core Mechanism:**  
Sharing caste identity with bank officials improves loan outcomes due to reduced information asymmetry.

### 1. Fisman, R., Paravisini, D., & Vig, V. (2017)  
*Cultural Proximity and Loan Outcomes.* American Economic Review.

**Finding:**  
Using data from a state-owned Indian bank, the authors show that when a borrower and loan officer share caste or religion:

- Loan approval probability increases  
- Loan size increases  
- Collateral requirements decrease  

**Mechanism:**  
Loan officers possess better “soft information” about borrowers from their own community, improving screening efficiency and reducing perceived risk.

---

## B. The “Information Diffusion” Channel  
### (Navigating Bureaucracy)

Caste networks function as information hubs that lower the procedural barriers of accessing formal banking.

### 2. Munshi, K. (2011)  
*Strength in Numbers: Networks as a Solution to Occupational Traps.* Review of Economic Studies.

**Finding:**  
Caste networks mitigate market imperfections, including credit constraints, by transmitting information and coordinating behavior.

**Application to Formal Credit:**  
Once one network member successfully navigates banking procedures, knowledge diffuses through the network (forms, contacts, procedures), reducing transaction costs for others.

---

### 3. Breza, E. (2016)  
*Peer Effects and Loan Repayment: Evidence from the Krishna Default Crisis.*

**Finding:**  
Financial behavior in India is socially driven. Repayment and default decisions are influenced by peers.

**Implication:**  
Information regarding interactions with banks spreads through social networks, reinforcing coordinated engagement with formal finance.

---

## C. The “Social Collateral” Channel  
### (Discrimination & Dominance)

Network strength influences both application rates and approval probability.

### 4. Kumar, S., et al. (2013)  
*Does Access to Formal Agricultural Credit Depend on Caste?* World Development.

**Finding:**  
Significant caste-based disparities exist in loan application and approval rates:

- SC/ST households apply less frequently  
- Dominant castes apply more and succeed more often  
- Social and political dominance influences cooperative bank access  

---

### 5. Banerjee, A., & Munshi, K. (2004)  
*How Efficiently is Capital Allocated? Evidence from the Knitted Garment Industry in Tirupur.* Review of Economic Studies.

**Finding:**  
Established community networks mobilize capital more effectively than outsiders.

**Extension to Formal Credit:**  
Community reputation and embeddedness function as social collateral, increasing lender confidence.

---

## Summary: Formal Credit Channel

Existing literature suggests that social networks facilitate formal credit access by:

- Reducing information asymmetries (Fisman et al., 2017)  
- Acting as information hubs that lower transaction costs (Munshi, 2011; Breza, 2016)  
- Providing reputational advantages and network dominance in credit markets  

The formal loan instrument captures these mechanisms by exploiting variation in caste-network level formal borrowing intensity.

---

# II. Informal Loan Instrument

The informal loan instrument is grounded in three primary mechanisms:

- Social collateral  
- Screening and information  
- Risk-sharing  

---

## A. The “Social Collateral” Channel  
### (Reputation as Currency)

Informal lenders rely on reputation rather than documentation.

### 1. Banerjee, A., & Munshi, K. (2004)

**Finding:**  
Gounder entrepreneurs accessed large amounts of intra-community informal capital, allowing them to scale businesses despite lower formal education.

**Implication:**  
Belonging to a high-lending caste directly increases access to informal capital.

---

### 2. Guirkinger, C. (2008)  
*Understanding the Coexistence of Formal and Informal Credit Markets in Piura, Peru.* World Development.

**Finding:**  
Households prefer informal credit due to lower transaction costs, with rationing based on social standing.

---

## B. The “Information & Screening” Channel

Informal lenders face high screening costs and rely on networks to assess borrower reliability.

### 3. Aleem, I. (1990)  
*Imperfect Information, Screening, and the Costs of Informal Lending.*

**Finding:**  
The primary cost of informal lending is screening time.

**Relevance:**  
Strong caste networks reduce screening costs and act as referral systems.

---

### 4. Hoff, K., & Stiglitz, J. E. (1990)  
*Introduction: Imperfect Information and Rural Credit Markets.*

**Finding:**  
Peer monitoring enables informal credit markets to function.

**Instrument Interpretation:**  
The average caste-peer borrowing level proxies for monitoring capacity and enforcement strength.

---

## C. The “Risk-Sharing” Channel  
### (Insurance)

Informal credit often operates as reciprocal insurance within caste networks.

### 5. Townsend, R. M. (1994)  
*Risk and Insurance in Village India.* Econometrica.

**Finding:**  
Financial risk-sharing occurs predominantly within caste and sub-caste groups (jatis).

**Methodological Relevance:**  
Aggregating at the District-Caste level reflects the empirically documented unit of insurance and credit exchange.

---

### 6. Munshi, K., & Rosenzweig, M. (2006)  
*Traditional Institutions Meet the Modern World: Caste, Gender, and Schooling Choice in a Globalizing Economy.* American Economic Review.

**Finding:**  
Caste networks function as mutual insurance systems that provide credit and support.

---

## Summary: Informal Credit Channel

The leave-out mean of caste-network informal borrowing is grounded in the theory of social collateral (Banerjee & Munshi, 2004).

Unlike formal banks that rely on physical collateral and documented histories, informal lenders depend on:

- Social sanctions  
- Reputational enforcement  
- Peer monitoring (Hoff & Stiglitz, 1990)

As Townsend (1994) demonstrates, rural financial flows operate primarily within caste lines. Therefore, a liquidity shock at the caste-network level reduces individual borrowing constraints through:

- Information diffusion  
- Reduced screening costs (Aleem, 1990)  
- Enhanced monitoring capacity  

---

# Implementation Note

These theoretical foundations justify the use of caste-level leave-out means as instruments for individual-level credit access in both formal and informal markets.

Users should consult the main repository documentation for:

- Instrument construction code  
- First-stage validation procedures  
- Robustness checks  
- Identification diagnostics  
