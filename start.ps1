$ErrorActionPreference = "Stop"

Write-Host "Initializing Shadowrun AI GM (Dev Mode)..." -ForegroundColor Cyan

# 1. Start Backend in a new window
Write-Host "Launching Backend (FastAPI)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd backend; .\venv\Scripts\Activate.ps1; python -m uvicorn main:app --reload"

# 2. Start Frontend in a new window
Write-Host "Launching Frontend (Vite)..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd frontend; npm run dev"

Write-Host "Systems Online." -ForegroundColor Cyan
Write-Host "Frontend: http://localhost:5173"
Write-Host "Backend:  http://localhost:8000"
