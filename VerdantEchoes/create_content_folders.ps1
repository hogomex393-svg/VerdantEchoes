# ============================================================
# UE5 Content 文件夹批量创建脚本（Windows PowerShell）
# 使用方法：
#   1. 把这个脚本放到你的 UE5 项目根目录（.uproject 同级）
#   2. 右键 → "用 PowerShell 运行"  或  在终端执行：
#      powershell -ExecutionPolicy Bypass -File .\create_content_folders.ps1
# ============================================================

$ContentPath = Join-Path $PSScriptRoot "Content"

$Folders = @(
    "Characters\Player",
    "Characters\Enemies",
    "Environment\Props",
    "Environment\Landscape",
    "UI\Widgets",
    "UI\Textures",
    "Weapons",
    "VFX",
    "Audio\Music",
    "Audio\SFX",
    "Maps",
    "Core"
)

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  UE5 Content 文件夹初始化脚本" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "目标路径：$ContentPath" -ForegroundColor Gray
Write-Host ""

$Created = 0
$Skipped = 0

foreach ($Folder in $Folders) {
    $FullPath = Join-Path $ContentPath $Folder
    if (Test-Path $FullPath) {
        Write-Host "  [已存在] $Folder" -ForegroundColor Yellow
        $Skipped++
    } else {
        New-Item -ItemType Directory -Path $FullPath -Force | Out-Null
        Write-Host "  [创建  ] $Folder" -ForegroundColor Green
        $Created++
    }
}

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "  完成！新建 $Created 个，跳过 $Skipped 个" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "提示：在 UE5 编辑器里刷新一下 Content Browser（右键 → Refresh）就能看到新文件夹。" -ForegroundColor Gray
Write-Host ""
