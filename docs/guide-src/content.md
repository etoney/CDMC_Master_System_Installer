## Quick start

From a rough mix to a balanced, prescribed one in five steps. Every step is explained in full later in this guide.

### 1. Prepare your mix

Do this before any Mix System plugin goes on. The Master and The Servants judge the mix as they hear it, so give them the mix as you mean it to sound.

- **Name your tracks** so each Servant can set its ROLE: "Lead Vox", "BG Vox", "Lead Gtr", "Rhythm Gtr", "Bass", "Kick", "Snare", "Drums", "Keys". Vocals need LEAD or BACKING (BG), guitars LEAD or RHYTHM. The full table is under The Servant.
- **Balance the levels with your faders.** A rough mix is enough: the lead on top, the drums and bass solid, nothing buried. Leave the master fader at 0 dB and keep the mix peaking somewhere around -6 dBFS, with nothing clipping.
- **Add your sound now: amp sims, saturation, distortion, chorus, flanger and phaser** go on the tracks themselves.
- **Reverb and delay** go on send / FX return tracks (or last on the track). Set them to taste before you play the song for The Master; it hears the returns as part of the mix.
- **Clear the master bus.** Bypass or remove any bus compressor, limiter or EQ. The Mix System builds its own master-bus chain.
- **Name your tracks** ("Bass", "Lead Vox", "Rhythm Gtr L"). The Master uses the names to tell you which track needs what.
- **Leave a little quiet** at the start or end of the song (a count-in or a second of silence). The Servants and Dead Air listen there for hum and amp noise.

### 2. Add The Servant and The Master

| Plugin | Where | Then |
| --- | --- | --- |
| The Servant | On **every** track you want balanced, after your amp sim and tone effects, before reverb and delay | Name the track so The Servant can set its **ROLE** ("Lead Vox", "BG Vox", "Rhythm Gtr L", "Kick"; see the naming table under The Servant), or pick the ROLE yourself (top right) |
| The Master | **Last** on the master bus, with nothing after it | Choose the genre (AUTO works). Leave OUTPUT at -6 dB (recommended) and master separately; -1 dB gives a finished master straight from the mix |

That's all to start with. The other plugins (The Freak, Cutthroat, Dominatrix, Dead Air, Flatliner, Low Blow) go on only where The Master asks for them. Each one links to The Master by itself; there is nothing to connect.

### 3. Play the song

Press **RESET** on The Master, then play the whole song from the top, in real time. The report's first line counts the Servants listening; check it matches your tracks. After 20 seconds the big button says **PRESCRIBE**; the whole song gives the best result.

### 4. Go to the fix

Press **PRESCRIBE**. The Master writes the prescription: THE PRESCRIPTION shows the plugins for the master bus, in order, and YOUR TRACKS shows what to add on each track (red rings). Insert them where shown; each turns green as it links. Then press **APPLY**: The Master sets every knob and writes the reason for each change in WHAT I CHANGED & WHY.

### 5. Play it again and refine

Play the song through once more and press **REFINE** to fine-tune from what came out. Changed the mix a lot (a new amp sim, much more reverb)? Press **RESET** and choose **START OVER**.

## Overview

The Master listens to your mix while you're still mixing, compares it with your genre (or with songs you choose), and then fixes it by setting your Castle Danger Music Company plugins for you, explaining every change. It sits last on the master bus. The other plugins in the Mix System do the actual work, on the bus and on your tracks, and link to The Master by themselves.

| Plugin | Version | Goes on | What it does in the system |
| --- | --- | --- | --- |
| The Master | 1.15.1 | Master bus, last | Analyses the mix, prescribes plugins, sets them, explains why |
| The Freak | 1.2.0 | Master bus, first (when prescribed); guitars or a guitar bus, to unmask the vocal | Dynamic EQ: cuts the ranges that jump out, or makes room for the vocal while it sings |
| Cutthroat | 1.4.0 | Master bus, before Dominatrix; also drum tracks | Shaves the peaks that stick out |
| Dominatrix | 1.4.1 | Master bus, before The Master; also a thin bass | Glue, colour, stereo; peaks held at -6 dB, or loudness into a -1 dB ceiling |
| The Servant | 0.10.0 | Every track you want balanced | Clean-up, resonance control, de-essing and a transient shaper; runs The Master's tone, compression and level |
| Dead Air | 2.4.0 | Guitar and bass tracks, right after the amp sim | Removes hum and amp noise between notes |
| Flatliner | 1.4.1 | Lead vocal (or any lead), first on the track | Auto leveler: evens out the words; louder sections stay louder |
| Low Blow | 1.1.0 | Bass track, with the kick on its sidechain | Ducks the bass under each kick so they stop fighting |

The Mix System installer puts all eight on your computer at these versions, and they link to each other by themselves. Everything runs offline, on your computer only.

## Install and set up

Run the Mix System installer, place the plugins where the session map below shows, and check the ROLE on every Servant. There is nothing to connect: they find each other.

### The Mix System installer

Unzip the download (one for macOS, one for Windows) and open the installer inside. It puts every plugin where your DAW looks, for every user on the computer, and copies this guide and each plugin's controls guide to the Guides folder. Untick any plugin you don't want.

| | Mac | Windows |
| --- | --- | --- |
| Plugins | VST3 in /Library/Audio/Plug-Ins/VST3, AU in /Library/Audio/Plug-Ins/Components (universal: Apple Silicon and Intel, macOS 11 or later) | VST3 in C:\Program Files\Common Files\VST3 (64-bit) |
| Guides | /Applications/Castle Danger Music Company/Guides | C:\Program Files\Castle Danger Music Company\Guides |

- **Mac:** the installer isn't signed by Apple yet, so the first double-click is blocked. Open **System Settings > Privacy & Security**, scroll to the message about the installer and click **Open Anyway**, then confirm with your password or Touch ID. The installer clears the "downloaded from the internet" flag and resets the Audio Unit cache for you.
- **Windows:** the installer isn't code-signed yet either. If SmartScreen says it protected your PC, click **More info**, then **Run anyway**.

Quit your DAW before installing, then rescan plugins when you reopen it. To update, run the newer installer over the old one. To remove the Mix System on Windows, use Settings > Apps.

### Where each plugin goes

- **Master bus**, in this order: The Freak (when prescribed), Cutthroat, Dominatrix, then **The Master last**. The Master must hear exactly what you will export.
- **Each track** you want balanced: The Servant. Its **ROLE** (top right) is set by the track name when you name the track for it (see the naming table under The Servant); otherwise pick one of: Lead Vocal, Backing Vocals, Lead Guitar, Rhythm Guitar, Bass, Kick, Snare, Drums, Keys / Pads or Other. The Master balances the mix by role: the lead vocal and lead guitar stay on top, backing vocals sit under the lead, kick and bass own the low end.
- **Not on buses.** Leave The Servant and the track plugins off your drum bus, vocal bus and other groups: the tracks inside already have their own. The Master spots a Servant on a bus, leaves it out and tells you to take it off; it never holds up UPDATE. The one bus plugin is Flatliner on a lead or backing vocal bus, when The Master asks for it.
- **Guitar and bass tracks** with amp noise: Dead Air, right after the amp sim and before The Servant, reverb and delay.
- **The lead vocal** (or another lead that jumps in level): Flatliner, first on the track. When the lead is spread over several tracks (doubles, comps), send only the lead tracks to a lead bus and put Flatliner there. Keep the backing vocals off it: Flatliner can't tell them apart from the lead, so it would lift them up to the lead whenever they sing alone. When the backing vocals jump around too, give them their own bus with its own Flatliner; The Master sets that one to a gentle ride (RANGE 3 dB). The Servants stay on the vocal tracks, not on the buses.
- **The bass track**: Low Blow, with the kick sent to its sidechain input. In Fender Studio Pro, click the sidechain button in Low Blow's window and pick the kick track.
- **Tracks that hide the lead vocal** (usually the guitars): The Freak, after The Servant, with the lead vocal sent to its sidechain. Three or more guitars: one Freak on a guitar bus (name it "Guitar Bus" or "Rhythm GTR Bus") instead of one per track. See UNMASK below.
- **Drum tracks** whose hits make the mix's peaks: Cutthroat, after The Servant. **A thin bass**: Dominatrix, after The Servant (before Low Blow). The Master asks for these when the mix needs them.

@@MAP@@

Every track runs into the mix bus; the bus chain ends with The Master, which hears the result and sets every Castle Danger Music Company plugin on the tracks and the bus.

You don't need every plugin from the start. The Master tells you which bus plugins to add when you press PRESCRIBE, and asks for Dead Air, Flatliner, Low Blow or The Freak on the guitars only when the mix needs them.

### Your own effects: where they go, and when

The Mix System doesn't replace your sound. Use your own amp sims, saturation, modulation, reverb and delay as usual. Where you put them matters, because The Servant hears what reaches it and The Master hears the whole mix.

| Effect | Where | Why |
| --- | --- | --- |
| Amp sims, saturation, distortion, chorus, flanger, phaser | On the track, before The Servant (after Dead Air on guitars) | The Servant judges the track's real sound, harmonics included. A bass you already saturate won't be asked for Dominatrix |
| Your own EQ or compressor | Before The Servant, or let The Servant do it | Anything after The Servant changes the track after The Master has balanced it |
| Reverb and delay | On send / FX return tracks (or last on the track) | The Master hears the returns in the mix. Dead Air and Cutthroat must come before them, or they cut the tails |
| Anything on the master bus | Avoid. If you must, first in the bus chain | The Master measures your mix with nothing in front of it. Bypass extras while it listens |

Track saturation is not discouraged: The Master only adds its own in two places, Dominatrix on the master bus (glue and colour for the whole mix) and on a bass that's too thin to be heard on small speakers.

**When:** set your character effects, reverbs and delays before you press RESET and play the song, so The Master and The Servants hear the mix as it will be. Small tweaks later are fine. After big changes (a new amp sim, much more reverb), press START OVER, play the song again and press PRESCRIBE.

### How they talk: Castle Danger Link

Every plugin finds The Master by itself over Castle Danger Link, a local connection on your computer only (nothing goes online). Each plugin shows a small lamp or line saying LINKED TO THE MASTER. The Master works out which track each plugin is on from the track name your DAW gives it, or, failing that, by matching its level to The Servant on the same track. Name your tracks clearly ("Lead Vox", "Rhythm Gtr L") and the log reads better.

### REBEL: when you want it your way

The Freak, Cutthroat, Dominatrix, Dead Air, Flatliner and Low Blow each have a **REBEL** switch next to the link lamp. With REBEL on, The Master keeps its hands off that plugin: nothing it sends (PRESCRIBE, APPLY, UPDATE, REFINE or START OVER) changes a setting there. It still hears what the plugin does, so the report and the prescription allow for it, and it plans the rest of the mix around it.

The Servant has no REBEL: it is how The Master balances your tracks, so it always follows The Master. To keep a sound you dialled in by hand, use its LOCK on TONE EQ or RESONANCE; The Master still sets that track's level and compression. To leave a track completely alone, leave The Servant off it.

- **Use it for character:** a Cutthroat crushing the drum bus, a Dominatrix driving a bass into fuzz, a Flatliner you've tuned yourself.
- **The Master switches it on for you** when it finds a Cutthroat or Dominatrix on a track that it didn't ask for. It does this once and says so in the plan. Turn REBEL off and press UPDATE to hand that plugin over; The Master won't switch it back on.
- **Switching REBEL on or off** makes The Master's main button say UPDATE.
- REBEL is saved with your project. Presets never change it.

## The Master's screen

The top half is always visible: what The Master is listening to, which genre it compares with, and what your mix sounds like. Below it, the step bar takes you through five steps, LISTEN > REPORT > PRESCRIPTION > APPLY > REFINE, with one big button beside it that always does the next thing.

@@FIG master|The Master: the report, with the genre bar and SOUNDS LIKE on top@@

### Always on top

| Area | What it shows | What you do with it |
| --- | --- | --- |
| ANALYSIS (top right) | LISTEN, RESET, PROFILES and a status line ("LISTENING // 03:21 ANALYSED") | RESET before you play the song. Once there is a prescription it asks: START OVER (plugins back to neutral) or MEASURE AGAIN. LISTEN off pauses the analysis |
| REFERENCE GENRE | AUTO, the four factory genres, MY PROFILES | Pick what to aim at. A red lamp marks your pick, a yellow lamp what your mix sounds like |
| SOUNDS LIKE | The genre guess, how sure it is ("48% SURE") and the runner-up | A check on AUTO, not a score |
| Step bar | LISTEN, REPORT, PRESCRIPTION, APPLY, REFINE: the step you're on glows, finished ones say OK | Click a step you've reached to look at it again |
| The big button | PLAY YOUR SONG, PRESCRIBE, APPLY, REFINE or UPDATE | Press it: it always does the next thing |

The percentage under SOUNDS LIKE is how sure the genre guess is. The mix score on the report is a different number: how close your mix is to the genre you aim at, out of 100.

### The report (LISTEN and REPORT)

The report on your mix as it comes in. Your audio passes through untouched here.

- **Tonal balance**: your mix in ten bands against the genre's normal range (the shaded bars). The bands are Sub 20-60 Hz, Bass 60-120, Low 120-250, Low Mid 250-500, Mid 500-1k, Hi Mid 1k-2k, Presence 2k-4k, Bite 4k-8k, Sheen 8k-12k and Air 12k-20k. A dot outside its bar is a band to fix.
- **Vitals**: loudness (LUFS), true peak (dBTP), punch (the peak-to-loudness ratio, in dB), loudness range (LU), stereo width and mono low end (how centred the bass is, 1.0 = fully mono). Each marker sits on the genre's range.
- **The Verdict**: the mix score out of 100, then every finding in plain English. Red items are fixes, yellow are checks, green is fine. Each one names the plugin that fixes it ("DOMINATRIX: set CEILING to -1 dB...").
- **YOUR MIX / AFTER FIXES** (top right of the tonal balance): report on your mix as it comes in, or on what comes out once something has been applied. **COPY** copies the whole report as text. **EXPORT DIAGNOSTICS** (next to COPY, and on the change log in the fix) saves one text file with the report, the prescription, the change log and every linked plugin's settings and measurements: send it to Castle Danger Music Company, with a note on what sounded wrong, to fine-tune the system.
- **PRESCRIBE**: the big button, once The Master has heard 20 seconds (before that it says PLAY YOUR SONG). It opens the prescription and prescribes straight away.

## Fixing your mix, step by step

The fix covers the last three steps on the bar. The left column spells out the step you're on and what to do. The big button at the top right always does it: PRESCRIBE, then APPLY, then REFINE, and it says UPDATE when you've added or removed plugins on your tracks since the prescription. Nothing in your session changes until you press APPLY.

@@FIG master_fix|The fix: the step you're on, THE PRESCRIPTION and WHAT I CHANGED &amp; WHY@@

@@CALLOUT Choose the OUTPUT first.|At the top of THE CURE, OUTPUT sets what the chain aims for.@@

- **-6 dB** (the default): a pre-master for a separate mastering step. Peaks are held just under -6 dBFS (Dominatrix CEILING -6 dB, The Master's safety limiter at -6 dBTP) and nothing is pushed for loudness. The report stops marking the mix down for being quieter than a finished record.
- **-1 dB**: a finished master, as loud as your genre, with peaks at -1 dBTP for Spotify, Apple Music and YouTube.

**We recommend leaving OUTPUT at -6 dB** and treating mastering as a separate step, with a dedicated mastering plugin, a mastering engineer or a mastering service. The Mix System is designed to deliver a balanced, controlled mix; mastering is a discipline of its own, and 6 dB of headroom gives it room to work. Choose -1 dB only when you need a release-ready file straight from the mix session, such as a demo or a reference copy.

You can flip it at any time. After PRESCRIBE or APPLY, The Master re-plans the loudness part from the same analysis (no need to play the song again) and sends the new settings.

1. **Set up, then listen.** Put **The Servant on every track** and check each one's ROLE (set by the track name when the track is named for it), and The Master last on the master bus. Bypass or remove any other plugins on the master bus, so The Master hears your untreated mix. Press **RESET**, then play the whole song from the start in real time. Until a Servant is linked, the report's first line says PUT THE SERVANT ON EVERY TRACK; after that it counts the Servants listening.
    - The Servants listen along with The Master, so one play-through covers the whole prescription. A Servant added later has to hear the song before UPDATE can plan it.
    - RESET also restarts every Servant, Dead Air and Flatliner, so all of them hear the same pass.
    - Play in real time rather than bouncing: The Master works out each track's level in the mix by comparing them live.
    - The step turns OK after about 20 seconds; the whole song gives the best result.
2. **Prescribe.** Press **PRESCRIBE** (if The Master hadn't heard enough yet, keep playing and press it again). It waits a moment while each Servant finishes listening and decides its own clean-up and resonances. Then THE PRESCRIPTION fills in:
    - **MASTER BUS**: the plugins to add, in order, each with a one-line reason ("Cutthroat: shaves the drum peaks that stick out...").
    - **YOUR TRACKS**: each track once, with the plugins to put on it in order ("1 DEAD AIR > 2 THE SERVANT"). A green lamp means that plugin is linked to The Master; a red ring means add it. Hover a track for the reasons. The list scrolls when there are more tracks than fit.
    - Anything missing shows in red on its track, such as FLATLINER on Lead Vox when its level swings 14 dB.
3. **Place the plugins.** Add the prescribed plugins to the master bus, in the order shown, before The Master. Each row's lamp changes from NOT FOUND: ADD IT to LINKED, and each track plugin you add turns green under YOUR TRACKS. Play a few seconds and The Master checks the order from their levels ("2 of 2 linked, in order").
4. **Apply.** Press **APPLY**. The Master sets every control on every linked plugin, exactly as if you'd turned the knobs, so undo and automation work in your DAW.
    - **WHAT I CHANGED &amp; WHY** lists every setting, old value to new, with the reason. A dot turns green when the plugin confirms.
    - The Master's own part is small: its tone match EQ covers only what the tracks couldn't fix, followed by a safety limiter at the OUTPUT ceiling (-6 or -1 dBTP).
5. **Refine.** Play the song through again (at least 20 seconds, ideally all of it), then press **REFINE**. The Master measures what actually came out and fine-tunes: mostly Dominatrix's OUTPUT for loudness, BASS MONO if the low end still isn't centred, and Cutthroat's CEILING if the peaks still stick out. With OUTPUT at -6 dB it keeps the peaks just under -6 dB instead of chasing loudness, backs off if the chain squashed the mix, and leaves Cutthroat alone. Each change is explained in the log, and MIX SCORE shows yours and the result side by side.

Override anything on the plugins themselves at any time; The Master only sets them again when you press APPLY or REFINE. Added or removed a plugin on a track afterwards? It turns green under YOUR TRACKS as soon as it links, and the main button says UPDATE: press it and The Master plans it in from the same analysis (no need to play the song again) and, if you'd already applied, sends the new settings. A Servant added later must hear its track first, so play the song, then UPDATE. Only after big changes to the mix itself, use **START OVER** (top right of the prescription panel): it puts every Mix System plugin back to neutral, so The Master hears your untreated mix. Then play the song from the top and press PRESCRIBE.

## The Servant on your tracks

The Servant does two jobs on each track. It decides that track's clean-up and resonance control itself, from what the track plays and its ROLE. Then it carries out The Master's tone, compression and level settings, which come from the whole mix. It has no profiles of its own and needs The Master on the master bus.

@@FIG servant|The Servant: ROLE, ORDERS, the curve, and the DE-ESSER, TRANSIENTS and COMPRESSOR row@@

### What each role gets

| Role | High-pass lands between | Low-pass | Rings ducked once they stand out by |
| --- | --- | --- | --- |
| Lead Vocal | 90-180 Hz | Off | 3 dB |
| Backing Vocals | 100-200 Hz | Off | 3 dB |
| Lead Guitar | 70-160 Hz | 10-14 kHz, above the fizz | 3 dB |
| Rhythm Guitar | 70-160 Hz | 8-12 kHz, above the fizz | 3 dB |
| Bass | 30-45 Hz | Off | 4 dB |
| Kick | 30-40 Hz | Off | 4.5 dB |
| Snare | 70-140 Hz | Off | 3 dB |
| Drums | 30-40 Hz | Off | 4.5 dB |
| Keys / Pads | 40-120 Hz | Off | 3.5 dB |
| Other | 30-80 Hz | Off | 3.5 dB |

Within each range, the high-pass follows where the track's own sound starts, so a vocal that starts at 250 Hz gets a higher cut than one that starts at 150. Changing the ROLE later re-decides the clean-up straight away from what was already heard.

### Who decides what

- **The Servant decides:** HIGH-PASS, LOW-PASS, up to 12 resonances (ducked only while they ring), and the de-esser's FREQ, just under where the track's "s" sounds sit.
- **The Master decides:** the six TONE EQ bands (its biggest moves for this track, up to ±6 dB each), COMPRESSOR on and AMOUNT for tracks that make the mix's peaks, TRIM, mainly to bring a buried lead up or a lead that's too far on top down, and the DE-ESSER: on, with its AMOUNT, for tracks whose "s" sounds jump 10 dB or more above the rest (usually the lead vocal; never drums or bass). It goes stronger when the mix's 4-8 kHz bite is already hot. TRIM looks at the vocals as a group: when the lead and backing vocals together are buried in 500 Hz - 4 kHz, they all come up a little (at most 3 dB). Backing vocals that sit too close to the lead come down (at most 4 dB) and the lead comes up a little (at most 1.5 dB): one or two backing parts end about 4 dB under the lead, a big stack of four or more (gang vocals, doubles) only about 2 dB under it.
- **The Master also decides TRANSIENTS:** more ATTACK on kick and snare when the mix is flat or their hits are soft (more for metal, never on hits that are already hard), less on snare and kit when the mix's peaks stick out, a shorter kick SUSTAIN when the low end is crowded (or for metal), less kit ring when the low mids are thick, and a softer pick attack on spiky rhythm guitars in a peaky mix.

Tone fixes are shared out by who causes them: the track that makes most of the mix's 250-500 Hz mud gets most of the cut, while kick and bass keep their low end and the lead keeps its presence.

### Reading and using it

- **ROLE** (top right): The Servant can set the role for you when you name your tracks properly (table below). The line under ROLE shows where it came from: **SET BY THE TRACK NAME**, **PICKED BY YOU**, or **NAME IT (E.G. "LEAD VOX") OR PICK ONE** when the name doesn't say. Pick a role yourself to override the name (it then stays put); choose **Set by the track name** at the top of the menu to go back.

| Name the track | ROLE |
| --- | --- |
| Lead Vox, Lead Vocal | Lead Vocal |
| Backing Vox, BG Vox, Backing Vocals | Backing Vocals |
| Lead Gtr, Lead Guitar | Lead Guitar |
| Rhythm Gtr, Rhythm Guitar | Rhythm Guitar |
| Bass | Bass |
| Kick | Kick |
| Snare | Snare |
| Drums, Tom, HiHat, Cymbal, Overheads | Drums |
| Keys, Piano, Synth, Organ, Pad | Keys / Pads |

Vocals need LEAD or BACKING (BG) in the name and guitars need LEAD or RHYTHM: "Vox 1" or "Gtr 2" on its own stays Other. Anything else in the name is fine, such as numbers, sides or extra words: "Lead Vox 2", "Rhythm_Gtr_L DI", "LeadVox dbl" and "02 Kick In" all work.
- **ORDERS** plate: WAITING (no Master found), LISTENING (since The Master's RESET), SERVED (decided at PRESCRIBE).
- **The curve**: grey is your track, red is how it comes out, orange is what The Servant is doing. Drag a numbered dot to move a tone band, scroll over it to widen it, click a red triangle to leave that resonance alone.
- **AMOUNT** scales the tone moves and resonance depth (100% = as decided, up to 150%). **MATCH** keeps the output level equal to the input; **COMPARE** plays the untouched track. Turn COMPARE off before you print.
- **DE-ESSER** (bottom row): ON, AMOUNT and FREQ. It turns down only the top end above FREQ, and only while an "s" or "t" sound is there, so vowels and the low end stay as they are. The readout shows how many dB it is cutting right now.
- **TRANSIENTS** (bottom row): ON, ATTACK and SUSTAIN, -100 to +100% each. ATTACK adds (+) or takes away (-) the first few milliseconds of each hit: + makes drums snap and picking cut through, - softens harsh or clicky attacks. SUSTAIN lengthens (+) or shortens (-) the tail after each hit: - tightens a boomy kick or a roomy kit. The Servant measures how hard the track's hits stick out of its own body, and The Master sets both from that. The readout shows the move right now, in dB.
- **COMPRESSOR** (bottom row): ON, STYLE and AMOUNT. STYLE on AUTO follows the ROLE: **PUNCH** for kick, snare and drums (a slower attack lets each hit's crack through, then the body is held), **SMOOTH** for the lead vocal, backing vocals and lead guitar (catches loud words or notes early and lets go slowly, like vocal levelling), **TIGHT** for bass (every note at the same level) and **GLUE** for everything else (gentle and slow). Pick a style to override it; The Master leaves your pick alone. The readout shows the style and how many dB it's taking off.
- **TRIM** works after MATCH, so it really changes the track's level in the mix.
- Any knob you turn yourself turns **gold**. The Master leaves a gold HIGH-PASS or LOW-PASS alone.
- **LOCK** on TONE EQ keeps that track's tone and clean-up exactly as they are; The Master still sets its compressor and trim. LOCK on RESONANCE keeps the current resonances at the next PRESCRIBE.

Keep The Servant on every track while The Master balances them. Once you're happy, you can print tracks to save CPU.

## The connected plugins

Each connected plugin works on its own as usual. When The Master is on the master bus, it also shows LINKED TO THE MASTER, and The Master sets the controls below on APPLY. Every value comes with its reason in the log.

### The Freak (master bus, first, when prescribed)

@@FIG freak|The Freak@@

A dynamic EQ: six bands that cut only while their range jumps out, and leave it alone the rest of the time. While it listens, The Master measures how far each range (sub to sheen) jumps above its usual share of the mix in the loud moments. Ranges that jump more than is normal for them get a band. Jumps that happen on every beat, like drum hits, count as the music, so it takes much more before The Freak touches them. If nothing jumps, The Freak isn't prescribed at all.

| Control | The Master sets | Why |
| --- | --- | --- |
| Bands | One per range that jumps: a bell at the range's centre (a high shelf for SHEEN), GAIN 0 | Moves only; the steady tone stays with The Master's TONE MATCH EQ, so they never fight |
| DEPTH | -2 to -6 dB, deeper the more the range jumps | Gentle, because it works on the whole mix |
| THRESHOLD | Just above the range's ordinary ups and downs (at least 6 dB for ranges that jump on the beat) | Only the excess gets cut |
| AMOUNT / SPEED | 100% / 50% | Every band at the depth above, medium reaction |

Under each band's knobs, The Freak shows The Master's reason, such as "PRESENCE: jumps 8.5 dB in the loud parts". On its curve, drag a band to move it, Cmd-drag (Alt-drag on Windows) for DEPTH, and use LISTEN to hear only what a band is catching. Turn LISTEN off before you bounce.

### UNMASK: The Freak on the guitars, keyed by the vocal

Two parts that play at the same time in the same range hide each other. A wall of guitars in 500 Hz - 4 kHz buries the words, and turning the vocal up only makes it shout. The fix is to give the range to the part that matters more and make the other one leave a pocket. Doing it only while the vocal sings means the guitars keep their full tone between the lines.

**Who wins.** The roles decide:

| Range | Wins | Makes room |
| --- | --- | --- |
| 500 Hz - 4 kHz (the words) | Lead vocal | Guitars, keys and other parts (never the backing vocals, drums or bass) |
| 1 - 4 kHz (the solo's bite) | Lead guitar | Rhythm guitars, keys and other parts |
| The low end | Kick | Bass, through Low Blow (see below) |

**What The Master measures.** From what the Servants report, it finds the lead vocal's two main ranges, how loud each other track is there against the vocal, and how often they play together. A track that sits within 6 dB of the vocal in one of its ranges (or above it), and plays during at least 30% of the vocal's lines, has to make room. A guitar solo that only plays between the lines doesn't.

**The dynamic pocket (The Freak).** Put The Freak on that track after The Servant, or on a bus that carries several of them, and send the lead vocal (or the lead vocal bus) to The Freak's sidechain. In Studio Pro, click the sidechain button in The Freak's window and pick the vocal. The Master then sets one **KEY** band for each of the vocal's ranges: a bell at the range's centre, no static gain, DEPTH -2 to -6 dB (deeper the more the track covers the vocal), THRESHOLD 8 dB. KEY bands listen to the sidechain. They cut while the vocal sings in their range, hold through the quieter words, and let go about half a second after a line ends.

**The fixed pocket (The Servant).** Until The Freak is there and hears the vocal, the track's Servant makes a smaller, fixed cut instead (1 - 3 dB, on top of any tone move). As soon as a keyed Freak covers the track and UPDATE runs, the fixed pocket goes away. The lead guitar's pocket in the rhythm guitars is always the fixed one, because The Freak listens to one sidechain, and that's the vocal.

**The winner is left alone.** The lead vocal gets no tone cut in its own ranges, even when the band is heavy: the parts that hide it make room instead.

The Master asks for The Freak in the track list (ADD The Freak, with the reason): on each track that hides the vocal, or on a guitar bus when three or more guitars do. A Freak that doesn't hear the vocal yet says NO VOCAL ON SIDECHAIN, and The Master asks for UPDATE as soon as it does.

### Cutthroat (master bus, first)

@@FIG chop|Cutthroat@@

Prescribed when your peaks stick out more than the genre allows, or, with OUTPUT at -1 dB, when the mix needs more than about 4 dB of extra loudness.

| Control | The Master sets | Why |
| --- | --- | --- |
| MODE | MASTER | Transparent mode for a full mix |
| SHAPE | SOFT | Rounds the peaks instead of cutting them flat |
| CEILING | 1.5-6 dB under your loudest peak | Shaves only the spikes |
| OVERSAMPLING | 4x | Keeps clipping harmonics from turning harsh |
| COLOR | 0% | Dominatrix adds the colour |

REFINE lowers CEILING by another 1 dB if the peaks still stick out after the chain.

### Cutthroat on drum tracks

When a kick, snare or drum track makes the mix's peaks, The Master asks for a second Cutthroat on that track (after The Servant). A clipper shaves the spike off each hit and keeps the punch, where a compressor softens it, so that track's Servant compressor is turned off. The Master tells it apart from the bus Cutthroat by its track name: name your tracks in the DAW. A Cutthroat you put on a track yourself, without being asked, gets REBEL switched on and is left as you set it (see REBEL).

| Control | The Master sets | Why |
| --- | --- | --- |
| CEILING | 2-6 dB under that track's loudest hit | Deeper the more its hits stick out of their body; a little deeper for metal and punk |
| MODE / SHAPE | MASTER / HARD (SOFT on a full kit) | Clean; nothing below the ceiling changes. Soft keeps a kit's cymbals from crunching |
| OVERSAMPLING | 2x | Clean enough on a single track, light on CPU |

### Dominatrix (master bus, just before The Master)

@@FIG dom|Dominatrix@@

Always prescribed: it glues and colours the mix. With OUTPUT at -1 dB it brings the mix up to the genre's loudness; at -6 dB it holds the peaks just under -6 dB and leaves loudness to the mastering step.

| Control | The Master sets | Why |
| --- | --- | --- |
| DISCIPLINE | 25% gentle glue; 50% for big swings between sections; 40% for peaky mixes; 0% if already squashed | Evens the mix out without crushing it |
| SATURATION TYPE and amount | TAPE if the top is harsh, WHIP if it's dull, IRON if the lows are thin, otherwise a touch of CONSOLE | Colour chosen from your tone |
| WIDTH | 60-150%, only when the stereo picture is off for the genre | Lows below 120 Hz stay put |
| BASS MONO | On when the low end isn't centred | Kick and bass belong in the middle |
| CEILING | -6 dB with OUTPUT at -6 dB (the default); -1 dB with OUTPUT at -1 dB | -6 dB leaves headroom for mastering; -1 dB is what Spotify, Apple Music and YouTube ask for |
| OUTPUT | At -6 dB: just enough to bring your peaks to just under -6 dB. At -1 dB: the gain still needed to reach the genre's loudness | REFINE lands it exactly after a play-through |
| ANALOG / MATCH | 0% / OFF | No hiss or wobble on a master; MATCH off so the real loudness comes out |

### Dominatrix on the bass

A bass whose 250 Hz - 2 kHz is thin all but disappears on phones and small speakers. When The Servant on the bass shows that, The Master asks for a second Dominatrix on the bass (after The Servant, before Low Blow) and uses only its saturation: **TUBE** for rock (warm, even harmonics), **WHIP** for metal, punk and hard rock (bite that cuts through guitars), 15-45% depending on how thin the bass is. DISCIPLINE 0 and CEILING OFF (no compression or clipping; The Servant compresses the bass), and MATCH on, so the bass level doesn't change.

### Dead Air (guitar and bass tracks)

@@FIG buzz|Dead Air@@

Dead Air learns your amp's noise by itself. The Master sets only how quickly it closes and makes sure you're not monitoring the noise:

- **RELEASE**: tight for metal and punk rhythm parts so palm mutes stop dead, looser for rock so tails fade more naturally, a little gentler on leads and bass, a little tighter on a noisy track.
- **HEAR REMOVED**: off, so you never print the noise by mistake.

**Where it goes is found for you.** The Master hears hum in the finished mix; each Servant listens to its own track's quiet parts (count-ins, gaps, endings) for 50 or 60 Hz hum and noise. So The Master asks for Dead Air only on the tracks whose Servant hears hum, and names them under YOUR TRACKS. A Dead Air on a track whose noise is far too quiet to hear shows **CLEAN, NOTHING TO REMOVE**. If the mix hums but no Servant hears it, the hum is on a track without The Servant: put one there.

The log gives the track's noise floor and the hum as the reason. Leave a second of silence (nobody playing) so Dead Air can learn the noise.

### Flatliner (lead vocal or lead instrument)

@@FIG flat|Flatliner@@

Flatliner is an auto leveler (*Level the Field*): it levels the track for you, pushing quiet passages up and pulling loud ones down. Flatliner measures how much the lead swings between its quiet and loud parts. The Master then sets:

- **SECTIONS**: on. Flatliner aims at where the vocal has been sitting over the last few seconds, not at one fixed level. It evens out the words, but when the band gets louder in a chorus and the singer rises with it, the vocal stays louder too; a quiet verse stays quiet.
- **TARGET**: where the lead sits on average. It's used only if you turn SECTIONS off; then every part of the song is pulled to that one level.
- **RANGE**: from the measured swing and the genre, at most 8 dB, since it only has to even out words, not whole sections. A lead that already holds steady (less than 6 dB swing) gets a gentle 3 dB.
- **SPEED**: quicker for metal, more natural for rock and punk.
- **GATE**: between the gaps and the quietest words, so breaths and room noise aren't pushed up.
- **RIDE**: on. LOOKAHEAD, MUSIC and OUTPUT stay as you set them.

**ARA: Flatliner on the clip itself.** In a DAW with ARA (Studio Pro, Logic, Cubase, Reaper and others), you can apply Flatliner to the vocal clip instead of inserting it on the track. In Studio Pro, drag Flatliner from the browser onto the clip. It then reads the whole take within seconds, without playing it, and plans the ride with the whole take in view:

- **Sections from the first word.** It finds where a section changes, so a chorus has its own level from its first word instead of a few seconds in.
- **No latency.** Every move is planned ahead, so the level is already there when a word starts, with no lookahead.
- **No pumping.** It knows where the breaths and gaps are, holds the level through them, and glides to the next phrase's level just before it starts.

The knobs work as usual, and turning one re-plans at once. THE LINE shows the whole take with the planned ride and a marker where playback is. If you comp, trim or move the clip, Flatliner reads it again by itself. MUSIC works in live mode only, since a clip has no sidechain. ARA works on clips, not buses, so a lead vocal bus still uses Flatliner in live mode, and so does a DAW without ARA (Ableton Live).

A lead that Flatliner levels doesn't also get The Servant's compressor for its jumps. Without Flatliner, The Master asks for it when the lead swings more than about 10 dB: on the lead's own track, or on a lead bus when the lead is spread over several tracks. Backing vocals that swing get their own bus and a gentle Flatliner (RANGE 3 dB), so they stay under the lead. Use one Flatliner per vocal: if the lead track has its own Flatliner and also goes to a lead bus with one, remove one of them, or the lead is leveled twice.

**Lead guitar.** A solo behaves like a vocal: low notes and legato runs sink, and bends, pinch harmonics and picked accents jump out. When the lead guitar swings more than about 10 dB, The Master asks for Flatliner on it: first on the track (after Dead Air, if it has one), or on a lead guitar bus named for it ("Lead GTR Bus") when the solo is spread over several tracks. On a guitar it sets a slower SPEED than on a vocal, so held notes and feedback ring out without pumping. RANGE is at most 6 dB, so the solo keeps its shape, and GATE sits above the amp's hiss, so the noise between phrases is never lifted. Rhythm guitars don't get Flatliner. The amp already holds them level, and their quiet bits (palm mutes, stops) are part of the riff. If you put it on a clean or acoustic part yourself, The Master sets it up the same gentle way.

### Low Blow (bass track, kick on the sidechain)

@@FIG lowblow|Low Blow@@

Kick and bass fight over the same low end. Low Blow goes on the bass and hears the kick through your DAW's sidechain: every kick hit pulls the bass's low end down for a moment, so the kick punches through and the bass fills the gaps. Until a kick arrives on the sidechain it leaves the bass alone, and its window says NO KICK ON THE SIDECHAIN.

With The Servant on the kick (ROLE Kick, or Drums) and the bass (ROLE Bass), The Master measures where the two fight and how evenly, then sets:

- **DEPTH**: from the genre (rock 4 dB, metal 6 dB), one more when they're almost exactly as loud in the same range, lighter when they hardly overlap.
- **CROSSOVER** (LOWS ONLY): just above where the kick's thump sits (90 Hz for a sub kick, 140 Hz for a punchy one), so only the bass's low end makes way and its growl stays.
- **RELEASE** and **HOLD**: from the gap between your kick hits, so the bass is fully back before the next one (fast for metal double kicks).

Without Low Blow, The Master suggests it when kick and bass are within 10 dB of each other in the same low band. The log says so if no kick is arriving on Low Blow's sidechain.

## Profiles: what The Master aims at

A profile is what records of a certain sound measure: loudness, punch, loudness range, stereo width, how mono the low end is, and the ten tonal bands, each with a normal range. Everything The Master reports and prescribes is measured against the profile you pick.

### Factory genres and AUTO

Rock, Hard Rock, Punk and Metal are built in. **AUTO** picks the closest one for you, and the yellow lamp in the genre bar shows what your mix sounds like even when you've picked a genre yourself. If AUTO keeps choosing something you don't intend, click the genre you're actually aiming at.

### My Profiles: your own, from songs you choose

Aim at a band, an album or your own best mix instead of a genre.

1. Click **MY PROFILES** (the last button in the genre bar) and choose **New profile from songs...** It's also in the PROFILES menu.
2. Name it ("My Band", "Album Sound"). The Master makes a folder with that name and opens it.
3. Drop in finished, mixed songs: WAV, AIFF, FLAC, MP3 or OGG, and M4A on a Mac. One song is enough; three or more is better.
4. The Master measures each song once, in the background, with the same analysis it runs on your mix. It keeps only the numbers in a hidden file in the folder; your audio is never copied or changed.
5. Pick the profile under MY PROFILES. It works everywhere a genre does: the report and the plugin prescription. AUTO considers your profiles too.

With one or two songs, The Master can't tell how much your sound varies, so it borrows the allowed range from the closest genre. From three songs on, the range comes from your songs. Add or remove songs any time and the profile updates by itself.

The folders live in `~/Library/Application Support/Castle Danger/The Master/Profiles/My Profiles/` on a Mac and `%APPDATA%\Castle Danger\The Master\Profiles\My Profiles\` on Windows. The profile you pick is saved inside your project, so the project opens correctly on another computer or after the folder is gone.

### Profile packs

Updated genre profiles may be posted on castledangermusic.com as a profile pack (.json). Install one with **PROFILES &gt; Import profile pack...**; every copy of The Master on your computer then uses it. **Restore factory profiles** undoes it. Your own My Profiles are kept separately and never included when a pack is exported.

## Tips and troubleshooting

| You see | What to do |
| --- | --- |
| A plugin won't load or appear in your DAW | Quit the DAW, run the Mix System installer again (on a Mac it clears the download flag and resets the Audio Unit cache), then rescan. In Fender Studio Pro, rescan from the plug-in manager and restart |
| A plugin says NOT LINKED TO THE MASTER | Check The Master is open on the master bus and every plugin is at the version in the Overview table. Close and reopen the plugin window |
| A prescribed plugin shows NOT FOUND: ADD IT | Put it on the master bus before The Master. If you have two copies open, play a few seconds so The Master can tell which one is on the bus |
| The order shows as wrong | Drag the plugins into the order the prescription lists, then play a few seconds |
| "Not enough playback heard with the Servants linked" | Press RESET and play the song in real time, not as an offline bounce, then PRESCRIBE again |
| The main button says UPDATE | A plugin was added to or removed from a track since the prescription. Press UPDATE (play the song first if it's a new Servant) |
| The Servant says WAITING | The Master isn't on the master bus, or the session isn't playing yet |
| A Flatliner plan says "not enough heard yet" | Play the song after RESET; it needs at least 5 seconds of the lead |
| Low Blow says NO KICK ON THE SIDECHAIN | Send the kick track to Low Blow's sidechain input. In Fender Studio Pro, click the sidechain button in Low Blow's window and pick the kick track, or add a send on the kick channel with Low Blow as the destination |
| The genre guess looks wrong | Pick the genre you're aiming at yourself, or make a My Profile from songs you like |
| The result is too loud or too quiet | Play it through and press REFINE. Repeat once if needed |
| The result is much quieter than records in my genre | That's OUTPUT at -6 dB, the default and our recommendation: it leaves headroom for a separate mastering step, where the loudness is set. For a release-ready file straight from the mix, switch OUTPUT to -1 dB at the top of THE CURE |

### Good habits

- Name your tracks before you start. The log and YOUR TRACKS read much better with "Lead Vox" than with "Audio 7".
- Name your tracks for their role ("Lead Vox", "Rhythm Gtr"...) so every Servant sets its ROLE, and check each one before the first RESET.
- Read WHAT I CHANGED &amp; WHY after every APPLY and REFINE. Every number there has a reason; if one doesn't suit the song, change it on the plugin.
- Keep The Master last on the master bus, after any limiter, so it hears exactly what you'll export.
- Export the mix at OUTPUT -6 dB and master it as a separate step, with your mastering plugin of choice or a mastering engineer.
