import re, subprocess, base64, html, pathlib
import sys
D = pathlib.Path(__file__).resolve().parent   # the guide's source folder (content.md, theme, images)

def b64(name, mime=None):
    mime = mime or ('image/png' if name.endswith('.png') else 'image/jpeg')
    return f"data:{mime};base64," + base64.b64encode((D/name).read_bytes()).decode()

md = (D/'content.md').read_text()
frag = subprocess.run(['pandoc', '-f', 'gfm', '-t', 'html5', '--wrap=none'], input=md,
                      capture_output=True, text=True, check=True).stdout

# ---- session map (drawn) ----
def chip(x, y, w, label, kind='trk'):
    cls = {'trk': 'c-trk', 'svt': 'c-svt', 'fx': 'c-fx', 'mst': 'c-mst'}[kind]
    return (f'<g class="{cls}"><rect x="{x}" y="{y}" width="{w}" height="26" rx="3"/>'
            f'<text x="{x + w/2}" y="{y + 17.5}">{label}</text></g>')

rows = [('LEAD VOX', ['FLATLINER', 'THE SERVANT']),
        ('RHYTHM GTR', ['DEAD AIR', 'THE SERVANT', 'THE FREAK']),
        ('BASS', ['DEAD AIR', 'LOW BLOW', 'THE SERVANT']),
        ('KICK', ['THE SERVANT']),
        ('SNARE', ['THE SERVANT']),
        ('KEYS / PADS', ['THE SERVANT'])]
svg = ['<svg viewBox="0 0 760 330" xmlns="http://www.w3.org/2000/svg" class="map">',
       '<text class="m-h" x="14" y="20">TRACKS</text><text class="m-h" x="540" y="20">MASTER BUS</text>']
y0 = 36
for i, (name, chain) in enumerate(rows):
    y = y0 + i * 44
    svg.append(f'<text class="m-trk" x="14" y="{y + 17.5}">{name}</text>')
    x = 104
    for p in chain:
        w = 104 if p == 'THE SERVANT' else 86
        svg.append(chip(x, y, w, p, 'svt' if p == 'THE SERVANT' else 'fx'))
        x += w + 10
    svg.append(f'<path class="m-wire" d="M{x - 6} {y + 13} H 470 V 175 H 500"/>')
    if name == 'KICK':
        kick_y = y
# sidechain wire kick -> low blow
lb_x = 104 + 86 + 10 + 43
svg.append(f'<path class="m-sc" d="M 160 {kick_y} V {y0 + 2*44 + 26 + 0}" />'.replace('160', str(lb_x)))
svg.append(f'<text class="m-sc-t" x="{lb_x + 6}" y="{kick_y - 6}">SIDECHAIN</text>')
# sidechain wire lead vox -> The Freak on the rhythm guitar (UNMASK)
fx = 104 + 86 + 10 + 104 + 10 + 43
svg.append(f'<path class="m-sc" d="M {fx} {y0 + 13} V {y0 + 44}" />')
svg.append(f'<text class="m-sc-t" x="{fx + 6}" y="{y0 + 34}">VOCAL KEY</text>')
bus = [('THE FREAK', 'fx'), ('CUTTHROAT', 'fx'), ('DOMINATRIX', 'fx'), ('THE MASTER', 'mst')]
for j, (p, k) in enumerate(bus):
    by = 40 + j * 62
    svg.append(chip(540, by, 150, p, k))
    if j:
        svg.append(f'<path class="m-wire" d="M615 {by - 36} V {by}"/>')
svg.append('<path class="m-wire" d="M500 175 H 520 V 30 H 615 V 40"/>')
svg.append('<path class="m-wire" d="M615 252 V 290"/><text class="m-out" x="615" y="308">EXPORT</text>')
svg.append('<text class="m-note" x="700" y="270">LAST.</text><text class="m-note" x="700" y="284">ALWAYS.</text>')
svg.append('</svg>')
MAP = ('<figure class="mapfig"><div class="plate-label">SESSION MAP</div>' + ''.join(svg) +
       '<figcaption>Every track runs into the mix bus. The bus chain ends with The Master, which hears the result and sets every plugin on it.</figcaption></figure>')
frag = re.sub(r'<p>@@MAP@@</p>', MAP, frag)

def fig(m):
    key, cap = m.group(1), m.group(2)
    return (f'<figure class="shot"><div class="bezel"><img src="{b64("shot_"+key+".jpg")}"/></div>'
            f'<figcaption>{cap}</figcaption></figure>')
frag = re.sub(r'<p>@@FIG (\w+)\|(.*?)@@</p>', fig, frag)
frag = re.sub(r'<p>@@CALLOUT (.*?)\|(.*?)@@</p>',
              lambda m: f'<div class="callout"><div class="callout-k">{m.group(1)}</div><div>{m.group(2)}</div></div>', frag)

# chapters: wrap each h2 into a chapter opener
n = [0]
def chap(m):
    n[0] += 1
    title = m.group(1)
    return (f'<section class="chapter"><div class="chap-head"><img class="port" src="{b64("porthole.png")}"/>'
            f'<div class="chap-num">{n[0]:02d}</div><h2>{title}</h2></div>')
frag = re.sub(r'<h2 id="[^"]*">(.*?)</h2>', chap, frag)
frag = re.sub(r'(?=<section class="chapter">)', '</section>', frag)
frag = frag.replace('</section>', '', 1) + '</section>'

# bold-caps control names inside tables' first column look like labels
frag = frag.replace('<table>', '<div class="tbl"><table>').replace('</table>', '</table></div>')

css = (D/'theme.css').read_text().replace('@@GRUNGE@@', b64('grunge.png')).replace('@@PAGEBG@@', b64('page_bg.jpg'))
body = f'''<!DOCTYPE html><html><head><meta charset="utf-8"><style>{css}</style></head>
<body><main>{frag}</main></body></html>'''
(D/'body.html').write_text(body)

cover_css = (D/'cover.css').read_text().replace('@@COVER@@', b64('cover_bg.jpg')).replace('@@GRUNGE@@', b64('grunge.png'))
montage = ''.join(f'<div class="mt mt{i}"><img src="{b64("shot_"+k+".jpg")}"/></div>'
                  for i, k in enumerate(['master_fix', 'servant', 'dom', 'freak', 'lowblow']))
cover = f'''<!DOCTYPE html><html><head><meta charset="utf-8"><style>{cover_css}</style></head><body>
<div class="cover">
  <div class="hz top"></div>
  <img class="badge" src="{b64('badge.png')}"/>
  <div class="kicker">OWNER'S MANUAL // VOL. 1</div>
  <h1><span class="the">THE</span> MASTER<br/><span class="ms">MIX SYSTEM</span></h1>
  <div class="sub">USER GUIDE <i>//</i> THE MASTER 1.14 <i>//</i> 8 PLUGINS, ONE BOSS</div>
  <div class="montage">{montage}</div>
  <div class="foot"><div class="slogan">We make music.</div><div class="meta">CASTLE DANGER MUSIC COMPANY<br/>CASTLEDANGERMUSIC.COM &nbsp;//&nbsp; NOVEMBER 2026</div></div>
  <div class="hz bottom"></div>
</div></body></html>'''
(D/'cover.html').write_text(cover)

STRIPE = ('repeating-linear-gradient(-45deg,#d9a21f 0 9px,#141010 9px 18px)')
header = f'''<div style="width:100%;height:0.72in;margin:0;padding:0;background:#1b1613;-webkit-print-color-adjust:exact;position:relative;font-family:'TeX Gyre Heros Cn';">
<div style="position:absolute;left:0;right:0;top:0;height:7px;background:{STRIPE};"></div>
<div style="position:absolute;left:0.65in;right:0.65in;top:0.34in;display:flex;justify-content:space-between;font-size:8px;letter-spacing:2.2px;color:#8a7a62;">
<span><b style="color:#d9622b">CASTLE DANGER MUSIC COMPANY</b> &nbsp;//&nbsp; THE MASTER MIX SYSTEM</span><span>USER GUIDE</span></div>
<div style="position:absolute;left:0.65in;right:0.65in;top:0.52in;height:1px;background:#3a2c22;"></div></div>'''
footer = f'''<div style="width:100%;height:0.72in;margin:0;padding:0;background:#1b1613;-webkit-print-color-adjust:exact;position:relative;font-family:'TeX Gyre Heros Cn';">
<div style="position:absolute;left:0.65in;right:0.65in;top:0.12in;height:1px;background:#3a2c22;"></div>
<div style="position:absolute;left:0.65in;right:0.65in;top:0.24in;display:flex;justify-content:space-between;align-items:center;font-size:8px;letter-spacing:2.2px;color:#8a7a62;">
<span style="font-style:italic;letter-spacing:1px;color:#a99a80;font-size:9px">We make music.</span>
<span style="color:#e8dcc0;font-size:11px;font-weight:bold;letter-spacing:1px;background:#7a2a12;padding:2px 9px;border:1px solid #c0502a">
<span class="pageNumber"></span></span></div>
<div style="position:absolute;left:0;right:0;bottom:0;height:5px;background:{STRIPE};"></div></div>'''

from playwright.sync_api import sync_playwright
with sync_playwright() as p:
    b = p.chromium.launch()
    pg = b.new_page()
    pg.goto('file://' + str(D/'cover.html')); pg.wait_for_timeout(300)
    pg.pdf(path=str(D/'cover.pdf'), format='Letter', print_background=True, margin=dict(top='0', bottom='0', left='0', right='0'))
    pg.goto('file://' + str(D/'body.html')); pg.wait_for_timeout(300)
    pg.pdf(path=str(D/'body.pdf'), format='Letter', print_background=True,
           margin=dict(top='0.72in', bottom='0.72in', left='0', right='0'))
    b.close()

from pypdf import PdfWriter, PdfReader
from reportlab.pdfgen import canvas
from reportlab.lib.colors import HexColor
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
import io
pdfmetrics.registerFont(TTFont('CondB', '/usr/share/fonts/truetype/dejavu/DejaVuSansCondensed-Bold.ttf'))
pdfmetrics.registerFont(TTFont('CondI', '/usr/share/fonts/truetype/dejavu/DejaVuSansCondensed-Oblique.ttf'))
body = PdfReader(str(D/'body.pdf'))
W, H = 612, 792
def furniture(n):
    buf = io.BytesIO(); c = canvas.Canvas(buf, pagesize=(W, H))
    c.setFillColor(HexColor('#1b1613')); c.rect(0, 0, W, H, stroke=0, fill=1)
    L, R = 0.65*72, W - 0.65*72
    # header
    c.setFont('CondB', 6.8); c.setFillColor(HexColor('#d9622b'))
    t1 = 'CASTLE DANGER MUSIC COMPANY'; c.drawString(L, H - 0.36*72, t1)
    c.setFillColor(HexColor('#8a7a62')); c.drawString(L + pdfmetrics.stringWidth(t1, 'CondB', 6.8) + 6, H - 0.36*72, '//  THE MASTER MIX SYSTEM')
    c.drawRightString(R, H - 0.36*72, 'USER GUIDE')
    c.setStrokeColor(HexColor('#3a2c22')); c.setLineWidth(0.8); c.line(L, H - 0.47*72, R, H - 0.47*72)
    # footer
    c.line(L, 0.6*72, R, 0.6*72)
    c.setFont('CondI', 7.5); c.setFillColor(HexColor('#a99a80')); c.drawString(L, 0.36*72, 'We make music.')
    s = str(n); c.setFont('CondB', 9); w = pdfmetrics.stringWidth(s, 'CondB', 9) + 14
    c.setFillColor(HexColor('#7a2a12')); c.setStrokeColor(HexColor('#c0502a')); c.rect(R - w, 0.3*72, w, 14, stroke=1, fill=1)
    c.setFillColor(HexColor('#e8dcc0')); c.drawCentredString(R - w/2, 0.3*72 + 4, s)
    c.showPage(); c.save(); buf.seek(0)
    return PdfReader(buf).pages[0]
w = PdfWriter()
for pgx in PdfReader(str(D/'cover.pdf')).pages:
    w.add_page(pgx)
for i, pgx in enumerate(body.pages):
    bg = furniture(i + 1)
    bg.merge_page(pgx)
    w.add_page(bg)
w.add_metadata({'/Title': 'Castle Danger Music Company: The Master Mix System User Guide', '/Author': 'Castle Danger Music Company'})
out = sys.argv[1] if len(sys.argv) > 1 else str(D.parent / 'Mix System User Guide.pdf')
with open(out, 'wb') as f:
    w.write(f)
print('pages', len(w.pages))
