# 1. 定义文件路径
$filePath = "C:\Windows\System32\GameBarPresenceWriter.exe"
$newName = "C:\Windows\System32\GameBarPresenceWriter.exe.bak"

# 检查文件是否存在
if (Test-Path $filePath) {
    Write-Host "正在处理: $filePath" -ForegroundColor Cyan

    # 2. 获取文件所有权 (将所有者改为当前管理员组)
    Write-Host "正在获取所有权..." -ForegroundColor Yellow
    takeown /f $filePath /a

    # 3. 授予当前用户完全控制权限
    Write-Host "正在修改权限..." -ForegroundColor Yellow
    icacls $filePath /grant administrators:F

    # 4. 重命名文件
    try {
        Rename-Item -Path $filePath -NewName "GameBarPresenceWriter.exe.bak" -ErrorAction Stop
        Write-Host "成功！文件已重命名为 GameBarPresenceWriter.exe.bak" -ForegroundColor Green
        Write-Host "请重启电脑以应用更改。" -ForegroundColor White
    }
    catch {
        Write-Host "重命名失败，请确保没有程序正在占用该文件。" -ForegroundColor Red
    }
}
else {
    if (Test-Path $newName) {
        Write-Host "文件已经重命名过了，无需重复操作。" -ForegroundColor Green
    }
    else {
        Write-Host "未找到目标文件，请检查路径是否正确。" -ForegroundColor Red
    }
}