import pandas as pd
import matplotlib.pyplot as plt

# Load data into a DataFrame
data = [
    {"job_title": "Data Analyst", "company_name": "Mantys", "salary_year_avg": 650000.0},
    {"job_title": "Director of Analytics", "company_name": "Meta", "salary_year_avg": 336500.0},
    {"job_title": "Associate Director- Data Insights", "company_name": "AT&T", "salary_year_avg": 255829.5},
    {"job_title": "Data Analyst, Marketing", "company_name": "Pinterest", "salary_year_avg": 232423.0},
    {"job_title": "Data Analyst (Hybrid/Remote)", "company_name": "Uclahealthcareers", "salary_year_avg": 217000.0},
    {"job_title": "Principal Data Analyst (Remote)", "company_name": "SmartAsset", "salary_year_avg": 205000.0},
    {"job_title": "Director, Data Analyst - HYBRID", "company_name": "Inclusively", "salary_year_avg": 189309.0},
    {"job_title": "Principal Data Analyst, AV Performance Analysis", "company_name": "Motional", "salary_year_avg": 189000.0},
    {"job_title": "Principal Data Analyst", "company_name": "SmartAsset", "salary_year_avg": 186000.0},
    {"job_title": "ERM Data Analyst", "company_name": "Get It Recruit - IT", "salary_year_avg": 184000.0},
    {"job_title": "REMOTE Director of Data Analytics", "company_name": "A-Line Staffing", "salary_year_avg": 170000.0},
    {"job_title": "DTCC Data Analyst", "company_name": "Robert Half", "salary_year_avg": 170000.0},
    {"job_title": "Azure Data Python Consultant", "company_name": "Kelly Science", "salary_year_avg": 170000.0},
    {"job_title": "Principal Data Science Analyst - DLMP", "company_name": "Mayo Clinic", "salary_year_avg": 169686.0},
    {"job_title": "Principal Data Science Analyst - Remote", "company_name": "Mayo Clinic", "salary_year_avg": 169322.0}
]

df = pd.DataFrame(data)

# Combine job title + company name for readability
df['label'] = df['job_title'] + " (" + df['company_name'] + ")"

# Sort by salary
df = df.sort_values(by='salary_year_avg', ascending=True)

# Plot
plt.figure(figsize=(10,8))
barlist=plt.barh(df['label'], df['salary_year_avg'], color=('skyblue'))
barlist[14].set_color('gold')
plt.title("Top 15 Highest-Paying Data Analyst Roles (2023)")
plt.xlabel("Average Salary (USD)")
plt.ylabel("")
plt.tight_layout()
plt.show()