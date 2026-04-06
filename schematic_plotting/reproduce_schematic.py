import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import seaborn as sns


def figure_style(font_size=7):
    sns.set(style="ticks", context="paper",
            font="sans-serif",
            rc={"font.size": font_size,
                "figure.titlesize": font_size,
                "figure.labelweight": font_size,
                "axes.titlesize": font_size,
                "axes.labelsize": font_size,
                "axes.linewidth": 0.5,
                "lines.linewidth": 1,
                "lines.markersize": 3,
                "xtick.labelsize": font_size,
                "ytick.labelsize": font_size,
                "savefig.transparent": True,
                "xtick.major.size": 2.5,
                "ytick.major.size": 2.5,
                "xtick.major.width": 0.5,
                "ytick.major.width": 0.5,
                "xtick.minor.size": 2,
                "ytick.minor.size": 2,
                "xtick.minor.width": 0.5,
                "ytick.minor.width": 0.5,
                'legend.fontsize': font_size,
                'legend.title_fontsize': font_size,
                'legend.frameon': False,
                })
    matplotlib.rcParams['pdf.fonttype'] = 42
    matplotlib.rcParams['ps.fonttype'] = 42
    matplotlib.rcParams['backend'] = 'QtAgg'
    colors = {
        'hit': sns.color_palette('Set2')[0],
        'miss': sns.color_palette('Set2')[1]
    }
    return colors


figure_style(font_size=7)
matplotlib.rcParams['backend'] = 'Agg'  # override for non-interactive rendering
matplotlib.use('Agg')

fig, ax = plt.subplots(figsize=(1.75, 1.75))

# --- Sinusoid parameters ---
x = np.linspace(0, 2 * np.pi, 500)
amplitude = 1.0
mean = 0.55
phase_offset = 1.2  # peak is at x = phase_offset

y = mean + amplitude * np.sin(x - phase_offset + np.pi / 2)

ax.plot(x, y, color='gray', linewidth=1, zorder=2)

peak_x = phase_offset
peak_y = mean + amplitude

# --- Dashed mean line ---
ax.axhline(y=mean, color='black', linewidth=0.5, linestyle='--', alpha=0.8, zorder=1)

# --- Phase arrow: horizontal at peak height, from x=0 to peak_x ---
ax.annotate('', xy=(peak_x, peak_y + 0.08), xytext=(0, peak_y + 0.08),
            arrowprops=dict(arrowstyle='<->', color='black', lw=0.6,
                            mutation_scale=4))
ax.text(peak_x / 2, peak_y + 0.18, 'Phase', fontsize=6, ha='center', color='black')

# --- Amplitude arrow: vertical from mean to peak, at the peak x position ---
ax.annotate('', xy=(peak_x, peak_y), xytext=(peak_x, mean),
            arrowprops=dict(arrowstyle='<->', color='black', lw=0.6,
                            mutation_scale=4))
ax.text(peak_x + 0.15, peak_y - 0.08, 'Amplitude', fontsize=6, va='top', color='black')

# --- Mean (baseline) arrow: vertical from y=0 to mean, on the right ---
mean_arr_x = 2 * np.pi + 0.4
ax.annotate('', xy=(mean_arr_x, mean), xytext=(mean_arr_x, 0),
            arrowprops=dict(arrowstyle='<->', color='black', lw=0.6,
                            mutation_scale=4))
ax.text(mean_arr_x + 0.12, mean / 2, 'Mean\n(baseline)', fontsize=6,
        va='center', color='black')

# --- X-axis line (y=0) ---
ax.axhline(y=0, color='black', linewidth=0.5, zorder=1)

# --- Y-axis arrow ---
y_top = peak_y + 0.7
ax.annotate('', xy=(0, y_top), xytext=(0, -0.3),
            arrowprops=dict(arrowstyle='->', color='black', lw=0.6,
                            mutation_scale=4))

# --- Axis styling ---
for spine in ax.spines.values():
    spine.set_visible(False)
ax.set_xticks([])
ax.set_yticks([])

ax.set_xlim(-0.4, 2 * np.pi + 2.2)
ax.set_ylim(-0.95, y_top + 0.2)

# --- Row of balls ---
n_balls = 9
ball_xs = np.linspace(0.15, 2 * np.pi - 0.15, n_balls)
ball_y_pos = -0.7

y_activity = mean + amplitude * np.sin(ball_xs - phase_offset + np.pi / 2)
norm = (y_activity - y_activity.min()) / (y_activity.max() - y_activity.min())
gray_values = 0.85 - norm * 0.82
colors = [str(g) for g in gray_values]

ax.scatter(ball_xs, [ball_y_pos] * n_balls,
           s=18, c=colors,
           edgecolors='none', zorder=5, marker='o')

plt.tight_layout()
plt.savefig('schematic_plotting/hdeltab_schematic_reproduced.png', dpi=300,
            bbox_inches='tight', facecolor='white')
plt.savefig('schematic_plotting/hdeltab_schematic_reproduced.pdf', dpi=300,
            bbox_inches='tight')
plt.show()
print("Done.")
