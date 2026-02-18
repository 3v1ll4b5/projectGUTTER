# Shadowrun AI GM - User Guide

## Table of Contents
1. [Getting Started](#getting-started)
2. [Character Creation](#character-creation)
3. [Playing with the AI GM](#playing-with-the-ai-gm)
4. [Campaign Management](#campaign-management)
5. [Dice Rolling](#dice-rolling)
6. [Troubleshooting](#troubleshooting)

---

## Getting Started

### Prerequisites
- **Ollama** installed with Mistral 7B model
- **Node.js** and **npm** for the frontend
- **Python 3.8+** for the backend

### Starting the Application
Run the startup script from the project root:
```powershell
.\start.ps1
```

This opens two windows:
- **Backend** (FastAPI on port 8000)
- **Frontend** (Vite on port 5173)

Access the app at: `http://localhost:5173`

---

## Character Creation

### Step 1: Priority Assignment
Assign priorities (A-E) to:
- **Metatype** (Human, Elf, Dwarf, Ork, Troll)
- **Attributes** (Physical and mental stats)
- **Magic/Resonance** (Magical abilities)
- **Skills** (Active skills and skill groups)
- **Resources** (Starting nuyen)

### Step 2: Metatype & Attributes
1. Select your metatype based on your priority
2. Spend attribute points on:
   - Body, Agility, Reaction, Strength
   - Willpower, Logic, Intuition, Charisma
3. Each attribute starts at minimum (1) and has a racial maximum

### Step 3: Active Skills
1. **Skill Points**: Spend on individual skills (max rating 6)
2. **Group Points**: Spend on skill groups (all skills in group get same rating)
3. Use the search bar and category filters to find skills
4. **Note**: You cannot raise individual skills if you've already raised their group

### Step 4: Finalize
1. Enter your character's name
2. Review your build
3. Click **CONFIRM IDENTITY** to save

Characters are saved to `data/characters.json`

---

## Playing with the AI GM

### Starting a Session
1. Click **MATRIX FEED** in the sidebar
2. (Optional) Select your character from **ROSTER** first for context
3. Type your message and press **SEND** or hit Enter

### How the AI GM Works
The GM:
- Narrates based on your actions and dice results
- Remembers conversation history (last 12 turns)
- Uses your character's stats when making suggestions
- Tracks campaign facts, threads, and story beats

### Tips for Better Gameplay
- **Be specific** with your actions
- **Provide dice results** when the GM asks for rolls
- **Ask for suggestions** if you're unsure what to do
- The GM won't take actions for you unless you explicitly ask

### Example Session
```
YOU: I want to hack into the corporate mainframe
GM: Roll your Hacking + Logic (6 dice). What's your result?
YOU: I got 3 hits
GM: [Narrates the outcome based on your roll]
```

---

## Campaign Management

### Understanding Campaigns
- Each campaign has separate memory and conversation history
- Campaigns are stored in `data/memory/{campaign_id}.json`
- Default campaign: `default.json`

### Creating a New Campaign

**Method 1: Via API**
```powershell
# Create a campaign called "seattle_shadows"
Invoke-RestMethod -Uri "http://localhost:8000/api/memory/seattle_shadows/clear" -Method POST
```

**Method 2: Manual File Creation**
Create `data/memory/my_campaign.json`:
```json
{
  "campaign_id": "my_campaign",
  "updated_at": "2026-02-05T08:00:00Z",
  "summary": [],
  "facts": {},
  "threads": [],
  "last_turns": []
}
```

### Switching Campaigns
Since the frontend uses "default" campaign:
1. Navigate to `data/memory/`
2. Rename `default.json` to `default_backup.json`
3. Rename your desired campaign to `default.json`
4. Refresh the app

### Campaign Memory Structure
- **summary**: Key story events
- **facts**: Important world state (NPCs, locations, relationships)
- **threads**: Active plot hooks and quests
- **last_turns**: Recent conversation (auto-limited to 12 turns)

### Viewing Campaign Memory
```powershell
Invoke-RestMethod -Uri "http://localhost:8000/api/memory/default" -Method GET
```

---

## Dice Rolling

### Using the Dice Roller
Located in the right sidebar:
1. Enter your **dice pool** (number of d6 to roll)
2. (Optional) Check **Edge** for exploding 6s
3. (Optional) Set a **Limit** to cap hits
4. Click **ROLL**

### Shadowrun 5e Dice Rules
- Roll a pool of d6
- **Hit**: 5 or 6
- **Glitch**: More than half the dice are 1s
- **Critical Glitch**: Glitch with 0 hits
- **Edge**: 6s explode (roll additional dice)

### Example
Pool: 8 dice, Edge: Yes, Limit: 5
- Roll: [6, 6, 4, 3, 2, 1, 1, 5]
- Hits: 3 (two 6s, one 5)
- Edge triggers: Roll 2 more dice
- Final result capped at Limit (5)

---

## Troubleshooting

### Backend Won't Start
**Error**: `ImportError: attempted relative import with no known parent package`
- **Fix**: Already fixed in the codebase. Make sure you're running the latest version.

### AI GM Not Responding
**Check**:
1. Is Ollama running? (`ollama serve`)
2. Is the Mistral model installed? (`ollama pull mistral:7b`)
3. Check backend logs for errors

### Character Creator Blank Screen
**Fix**: Already resolved. Make sure you have the latest code with:
- Height wrapper in `App.tsx`
- All engineering skills defined in `rules.ts`

### 500 Errors When Saving Characters
**Check**:
1. Backend is running on port 8000
2. No import errors in backend logs
3. `data/` directory exists and is writable

### Timestamps Wrong in Chat
**Fix**: Already resolved. Each message now stores its timestamp when created.

---

## File Locations

### Data Files
- **Characters**: `data/characters.json`
- **Campaign Memory**: `data/memory/{campaign_id}.json`

### Configuration
- **Backend**: `backend/main.py`
- **Frontend**: `frontend/src/`
- **AI Model**: Set in `backend/routes/chat.py` (line 7)

### Changing the AI Model
Edit `backend/routes/chat.py`:
```python
MODEL = "mistral:7b"  # Change to your preferred model
```

Restart the backend after changes.

---

## Advanced Features

### Supplements
Click **SUPPLEMENTS** to view Shadowrun sourcebooks and rules references.

### Character Roster
Click **ROSTER** to:
- View all created characters
- Select active character for GM context
- Load character stats

### Memory Summarization
Generate AI summaries of your campaign:
```powershell
Invoke-RestMethod -Uri "http://localhost:8000/api/memory/default/summarize" -Method POST
```

This creates 5-8 bullet points summarizing recent events.

---

## Tips & Best Practices

### Character Creation
- Plan your build before starting
- Balance combat, social, and technical skills
- Don't forget knowledge skills for roleplay

### Gameplay
- Keep dice results handy for quick reference
- Use the character sheet to track damage and conditions
- Save important campaign moments in your own notes

### Campaign Management
- Create separate campaigns for different storylines
- Back up your `data/` folder regularly
- Use descriptive campaign names

---

## Support & Feedback

This is Project GUTTER - an AI-powered Shadowrun GM assistant. For issues or suggestions, check the project README.

**Enjoy running the shadows, chummer!** 🌃⚡
