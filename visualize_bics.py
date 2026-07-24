import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np

# Set aesthetic visual layout
sns.set_theme(style="whitegrid")
plt.rcParams['font.sans-serif'] = 'DejaVu Sans'

fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# Plot 1: ONS BICS Response & Sample Rates
wave_data = pd.DataFrame({
    'Wave': ['Wave 158\n(18 Jun 2026)', 'Wave 159\n(02 Jul 2026)', 'Wave 160\n(23 Jul 2026)'],
    'Responses': [10054, 10311, 10073],
    'Response_Rate': [26.0, 26.7, 26.1]
})

x = np.arange(len(wave_data['Wave']))
ax1 = axes[0]
bars1 = ax1.bar(x - 0.17, wave_data['Responses'], 0.35, label='Responses', color='#1f77b4')
ax1_twin = ax1.twinx()
line1 = ax1_twin.plot(x, wave_data['Response_Rate'], color='#d62728', marker='o', linewidth=2.5, markersize=8)

ax1.set_ylabel('Number of Responses', color='#1f77b4', fontweight='bold')
ax1_twin.set_ylabel('Response Rate (%)', color='#d62728', fontweight='bold')
ax1.set_xticks(x)
ax1.set_xticklabels(wave_data['Wave'])
ax1.set_title('ONS BICS: Survey Participation & Response Rate by Wave', fontsize=12, fontweight='bold')
ax1_twin.set_ylim(20, 30)
ax1.set_ylim(0, 12000)

for bar in bars1:
    yval = bar.get_height()
    ax1.text(bar.get_x() + bar.get_width()/2, yval + 150, f'{yval:,}', ha='center', va='bottom', fontsize=9)

for i, txt in enumerate(wave_data['Response_Rate']):
    ax1_twin.annotate(f'{txt}%', (x[i], wave_data['Response_Rate'][i] + 0.3), ha='center', color='#d62728', fontweight='bold')

# Plot 2: Top Macroeconomic Concerns
challenges_df = pd.DataFrame({
    'Challenge': ['Energy Price Concerns', 'Cost of Labour (10+ emp)', 'Economic Uncertainty', 'Energy Price Driven Inflation', 'Turnover Decline Expected'],
    'Percentage': [59.0, 36.0, 32.0, 24.0, 18.0]
})

ax2 = axes[1]
palette = ['#ff7f0e', '#2ca02c', '#d62728', '#9467bd', '#8c564b']
bars2 = ax2.barh(challenges_df['Challenge'], challenges_df['Percentage'], color=palette, height=0.6)
ax2.set_xlabel('Percentage of Businesses Reporting (%)', fontweight='bold')
ax2.set_title('Top Macroeconomic Concerns Facing UK Businesses (July 2026)', fontsize=12, fontweight='bold')
ax2.set_xlim(0, 70)

for bar in bars2:
    xval = bar.get_width()
    ax2.text(xval + 1, bar.get_y() + bar.get_height()/2, f'{xval:.1f}%', va='center', fontweight='bold', fontsize=9)

plt.tight_layout()
plt.savefig('ons_bics_visualisation.png', dpi=300)
plt.show()