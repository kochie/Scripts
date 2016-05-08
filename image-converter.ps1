# Try uncommenting the following line if you receive errors about a missing assembly
# [void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function ConvertTo-Jpg
{
  [cmdletbinding()]
  param([Parameter(Mandatory=$true, ValueFromPipeline = $true)] $Path)

  process{
    $qualityEncoder = [System.Drawing.Imaging.Encoder]::Quality
    $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)

    # Set JPEG quality level here: 0 - 100 (inclusive bounds)
    $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter($qualityEncoder, 100)
    $jpegCodecInfo = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | where {$_.MimeType -eq 'image/jpeg'}

    if ($Path -is [string]) {
      $Path = get-childitem $Path
    }

    $Path | foreach {
      $image = [System.Drawing.Image]::FromFile($($_.FullName))
      $filePath =  "{0}\{1}.jpg" -f $($_.DirectoryName), $($_.BaseName)
      $image.Save($filePath, $jpegCodecInfo, $encoderParams)
      $image.Dispose()
    }
  }
}

#Use function:
# cd to directory with png files



#Run ConvertTo-Jpg function
Get-ChildItem *.png | ConvertTo-Jpg
