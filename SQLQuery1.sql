select * from members;

select * from claims; 

---- join the two tables see in one table
select *
from members as m
left join claims as c
 on m. member_id= c. claim_id;

--- Claim Type Cost Breakdown
Group all claims by claim_type and calculate:Total billed_amount, Total paid_amount, Number of claims

select claim_type, 
count(*) as number_clam, 
sum(billed_amount) as total_billed_amount, sum (paid_amount) as total_paid_amount,
avg(billed_amount) as total_billed_per_clam, avg(paid_amount) as avg_paid_per_clan
from claims
group by claim_type
order by total_billed_amount desc

---



2, Find the top 10 CPT codes by total paid amount.

Find the top 10 ICD codes by total paid amount.

Identify CPT codes with a high paid amount per claim by calculating:

average_paid_per_claim = total_paid_amount ÷ claim_count

select top 10 icd_code, cpt_code,
MAX(paid_amount) as total_paid 
from claims
group by icd_code, CPT_CODE
order by  total_paid desc



3, Calculate total paid amount per member.
Identify the top 5–10 highest-cost members.
For each high-cost member, break down which claim types (inpatient, outpatient, ER, pharmacy) drive their costs

select top 10  claim_type, max(paid_amount)
from claims as c
left join members as m
on c. member_id= m. member_id 
where claim_type in ('inpatient', 'outpatient', 'ER', 'pharmacy')
group by claim_type,paid_amount
order by claim_type

4. Billed vs Paid Ratio
Calculate:paid_ratio = paid_amount ÷ billed_amount,Then compare average paid ratios by:claim_type provider,CPT code


select claim_type, avg(billed_amount) as clam, 
avg(paid_amount) * 1.0/ avg (billed_amount) as avg_paid_per_clam
from claims
group by claim_type
order by claim_type desc


