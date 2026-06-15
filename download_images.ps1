# Run from your repo ROOT in PowerShell (the folder with index.html). Saves photos into .\assets\
$ErrorActionPreference="Stop"
New-Item -ItemType Directory -Force -Path assets | Out-Null

Write-Host "  hong-kong-victoria-harbour-at-sunset.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1619187269972-267d2b78a423?fit=crop&w=1600&q=80&fm=webp" -OutFile "assets/hong-kong-victoria-harbour-at-sunset.webp"
Write-Host "  aerial-view-of-a-container-port-at-nig.jpg"; Invoke-WebRequest -Uri "https://images.pexels.com/photos/8777703/pexels-photo-8777703.jpeg?auto=compress&cs=tinysrgb&w=1600&fit=crop" -OutFile "assets/aerial-view-of-a-container-port-at-nig.jpg"
Write-Host "  our-team-coordinating-a-sourcing-proje.jpg"; Invoke-WebRequest -Uri "https://images.pexels.com/photos/3183183/pexels-photo-3183183.jpeg?auto=compress&cs=tinysrgb&w=600&h=800&fit=crop" -OutFile "assets/our-team-coordinating-a-sourcing-proje.jpg"
Write-Host "  reviewing-supplier-documents-and-speci.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1507208773393-40d9fc670acf?fit=crop&w=600&h=800&q=80&fm=webp" -OutFile "assets/reviewing-supplier-documents-and-speci.webp"
Write-Host "  reviewing-samples-and-quotations.jpg"; Invoke-WebRequest -Uri "https://images.pexels.com/photos/7013912/pexels-photo-7013912.jpeg?auto=compress&cs=tinysrgb&w=600&h=800&fit=crop" -OutFile "assets/reviewing-samples-and-quotations.jpg"
Write-Host "  production-on-a-modern-automated-line.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1716191299980-a6e8827ba10b?fit=crop&w=600&h=800&q=80&fm=webp" -OutFile "assets/production-on-a-modern-automated-line.webp"
Write-Host "  inspecting-a-circuit-board-during-qual.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1733749130045-c8777fd49509?fit=crop&w=600&h=800&q=80&fm=webp" -OutFile "assets/inspecting-a-circuit-board-during-qual.webp"
Write-Host "  containers-staged-for-export.jpg"; Invoke-WebRequest -Uri "https://images.pexels.com/photos/1427541/pexels-photo-1427541.jpeg?auto=compress&cs=tinysrgb&w=600&h=800&fit=crop" -OutFile "assets/containers-staged-for-export.jpg"
Write-Host "  photo-1513224502.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1513224502586-d1e602410265?fit=crop&w=900&q=80&fm=webp" -OutFile "assets/photo-1513224502.webp"
Write-Host "  photo-37489593.jpg"; Invoke-WebRequest -Uri "https://images.pexels.com/photos/37489593/pexels-photo-37489593.jpeg?auto=compress&cs=tinysrgb&w=900&h=700&fit=crop" -OutFile "assets/photo-37489593.jpg"
Write-Host "  photo-1519138130.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1519138130-85a949fdcb4f?fit=crop&w=900&q=80&fm=webp" -OutFile "assets/photo-1519138130.webp"
Write-Host "  photo-1759238136.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1759238136854-a43787126db7?fit=crop&w=900&q=80&fm=webp" -OutFile "assets/photo-1759238136.webp"
Write-Host "  photo-1758193783.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1758193783649-13371d7fb8dd?fit=crop&w=900&q=80&fm=webp" -OutFile "assets/photo-1758193783.webp"
Write-Host "  photo-1724597500.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1724597500306-a4cbb7d1324e?fit=crop&w=1600&q=80&fm=webp" -OutFile "assets/photo-1724597500.webp"
Write-Host "  milan-business-district-skyline-southe.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1645115130719-968d40a51ee1?crop=focalpoint&fit=crop&fp-x=0.5&fp-y=0.38&w=1000&h=1333&q=80&fm=webp" -OutFile "assets/milan-business-district-skyline-southe.webp"
Write-Host "  s-o-paulo-skyline-south-america-market.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1645918899630-85e2f3132a84?fit=crop&w=1000&q=80&fm=webp" -OutFile "assets/s-o-paulo-skyline-south-america-market.webp"
Write-Host "  chicago-skyline-eu-us-and-oceania-mark.webp"; Invoke-WebRequest -Uri "https://images.unsplash.com/photo-1547838555-c7d17212cacc?fit=crop&w=1000&h=1333&q=80&fm=webp" -OutFile "assets/chicago-skyline-eu-us-and-oceania-mark.webp"

Write-Host "Done — 17 images saved in .\assets\"
