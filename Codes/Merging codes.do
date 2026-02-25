/* ========================================================================== */
/* MASTER DATA CREATION: IHDS-II MERGE (DS1 + DS2 + DS12)                     */
/* ========================================================================== */

clear all
set more off
set maxvar 30000


/* ========================================================================== */
/* STEP 1: PREPARE DS12 (NON-FARM BUSINESS FILE)                              */
/* Issue: Multiple businesses per household. Need to aggregate to HH Level.   */
/* ========================================================================== */

use "/Users/anshuman/Downloads/ICPSR_36151/DS0012/36151-0012-Data.dta", clear // Check your actual filename for DS12

* 1. Create Business Indicators
gen business_exists = 1

* 2. Rename Financials for Aggregation (Adjust variable names if needed)
* (Assuming NF3 is Gross Receipts, NF6 is Investment - Check codebook)
rename NF3 biz_gross_receipts
rename NF6 biz_capital_investment
rename NF4C biz_hired_labor

* 3. Collapse to Household Level (Summing values if they have >1 business)
collapse (sum) biz_gross_receipts biz_capital_investment biz_hired_labor ///
         (count) num_businesses=business_exists, ///
         by(STATEID DISTID PSUID HHID HHSPLITID)

* 4. Save Temp File
gen has_business_ds12 = 1
sort STATEID DISTID PSUID HHID HHSPLITID
save "$work_data\temp_ds12_collapsed.dta", replace /// Save it through file tab, it's better


/* ========================================================================== */
/* STEP 2: PREPARE DS1 (INDIVIDUAL FILE)                                      */
/* Issue: We need Head of Household characteristics for the regression.       */
/* ========================================================================== */

use "/Users/anshuman/Downloads/ICPSR_36151/DS0001/36151-0001-Data.dta", clear // Check your actual filename for DS1

* 1. Rename Key Demographic Variables
rename RO3  relation_to_head
rename RO5  Sex
rename RO6  Age
rename ED2  Literacy
rename ED6  Years_of_Schooling

* 2. Keep only Household Heads (Relation = 1)
* (Crucial: We are analyzing HH-level decisions, so we map HH traits to Head)
keep if relation_to_head == 1

* 3. Select relevant variables to avoid clutter
keep STATEID DISTID PSUID HHID HHSPLITID ///
     Sex Age Literacy Years_of_Schooling PERSONID

* 4. Save Temp File
rename Sex head_sex
rename Age head_age
rename Years_of_Schooling head_education
sort STATEID DISTID PSUID HHID HHSPLITID
save "$work_data\temp_ds1_head.dta", replace /// Save it through file tab, it's better


/* ========================================================================== */
/* STEP 3: PREPARE DS2 (HOUSEHOLD FILE - THE BASE)                            */
/* ========================================================================== */

use "/Users/anshuman/Downloads/ICPSR_36151/DS0002/36151-0002-Data.dta", clear // Check your actual filename for DS2

* 1. Sort for Merging
sort STATEID DISTID PSUID HHID HHSPLITID

/* ========================================================================== */
/* STEP 4: PERFORM THE MERGE                                                  */
/* ========================================================================== */

* --- MERGE 1: Add Head of Household Details (from DS1) ---
merge 1:1 STATEID DISTID PSUID HHID HHSPLITID using "$work_data\temp_ds1_head.dta"
drop if _merge == 2 // Drop Heads without Households (Data errors)
drop _merge

* --- MERGE 2: Add Business Details (from DS12) ---
merge 1:1 STATEID DISTID PSUID HHID HHSPLITID using "$work_data\temp_ds1_collapsed.dta"

* 1. Handle Non-Matching (Households with NO Business)
* If _merge == 1 (In Master only), they have 0 business income/investment
replace has_business_ds12 = 0 if missing(has_business_ds12)
replace biz_gross_receipts = 0 if missing(biz_gross_receipts)
replace biz_capital_investment = 0 if missing(biz_capital_investment)
replace num_businesses = 0 if missing(num_businesses)

drop _merge

/* ========================================================================== */
/* STEP 5: FINAL CLEANUP & SAVE                                               */
/* ========================================================================== */

* 1. Generate the Main Outcome Variable (Non-Farm Business Dummy)
* (Usually defined as having >0 receipts or being in DS12)
gen Nonfarm_business = (has_business_ds12 == 1)

* 2. Label Key Variables
label variable Nonfarm_business "Household owns a Non-Farm Business (DS12)"
label variable head_sex "Sex of Household Head"
label variable head_age "Age of Household Head"

* 3. Save Final Master
save "$work_data\IHDS_Master_Analysis_File.dta", replace /// Save it through file tab, it's better

desc
summarize Nonfarm_business
