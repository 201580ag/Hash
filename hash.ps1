# 해시를 계산할 파일 경로
$filePath = ""

# 지원되는 해시 알고리즘 목록
$hashAlgorithms = @("SHA1", "SHA256", "SHA384", "SHA512", "MD5")

# 결과 저장
$results = @()

# 각 알고리즘에 대해 해시 계산
foreach ($algorithm in $hashAlgorithms) {
    try {
        $hash = Get-FileHash -Path $filePath -Algorithm $algorithm
        $results += [PSCustomObject]@{
            Algorithm = $algorithm
            Hash = $hash.Hash
        }
    } catch {
        Write-Host "Error calculating hash with algorithm: $algorithm" -ForegroundColor Red
    }
}

# 결과 출력
$results | Format-Table -AutoSize
