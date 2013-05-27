#
#   exifparser/makernote/sony.rb
#
require 'exifparser/tag'
require 'exifparser/utils'

module Exif

  module Tag

    module MakerNote
      #
      # 0x0102 - Image Quality
      #
      class SonyQuality < Base
        Quality = {
          0 => "Raw",
          1 => "Super Fine",
          2 => "Fine",
          3 => "Standard",
          4 => "Economy",
          5 => "Extra Fine",
          6 => "Raw + JPEG",
          7 => "Compressed Raw",
          8 => "Compressed Raw + JPEG"
        }

        def to_s
          Quality.has_key?(@formatted) ? Quality[@formatted] : @formatted.to_s + " (Unknown)"
        end

      end

      #
      # 0x0104 - Flash exposure compensation in EV
      #
      class SonyFlashExposureComp < Base

        def to_s
          if @formatted.numerator == 0
            "0 EV"
          else
            @formatted.to_s + "EV"
          end
        end

      end

      #
      # 0x0105 - Teleconverter Model
      #
      class SonyTeleconverter < Base

        def to_s
          case @formatted
          when 0x00
            "None"
          when 0x48
            "Minolta AF 2x APO (D)"
          when 0x50
            "Minolta AF 2x APO II"
          when 0x88
            "Minolta AF 1.4x APO (D)"
          when 0x90
            "Minolta AF 1.4x APO II"
          else
            "Unknown"
          end
        end

      end

      #
      # 0x0112 - White Balance Fine Tune Value
      #
      class SonyWhiteBalanceFineTune < Base
      end

      #
      # 0x0114 - Camera Settings
      #
      class SonyCameraSettings < Base
      end

      #
      # 0x0115 - White balance
      #
      class SonyWhiteBalance < Base
        def to_s
          case @formatted
          when 0x00
            "Auto"
          when 0x01
            "Color Temperature/Color Filter"
          when 0x10
            "Daylight"
          when 0x20
            "Cloudy"
          when 0x30
            "Shade"
          when 0x40
            "Tungsten"
          when 0x50
            "Flash"
          when 0x60
            "Fluorescent"
          when 0x70
            "Custom"
          else
            "Unknown"
          end
        end
      end

      #
      # 0x0e00 - PrintIM information
      #
      class SonyPrintIM < Base
      end

      #
      # 0x1000 - Multi Burst Mode
      #
      class SonyMultiBurstMode < Base
        def to_s
          case @formatted
          when 0
            "Off"
          when 1
            "On"
          else
            "Unknown"
          end
        end
      end

      #
      # 0x1001 - Multi Burst Image Width
      #
      class SonyMultiBurstImageWidth < Base
      end

      #
      # 0x1002 - Multi Burst Image Height
      #
      class SonyMultiBurstImageHeight < Base
      end

      #
      # 0x1003 - Panorama
      #
      class SonyPanorama < Base
      end

      #
      # 0x2001 - Preview Image
      #
      class SonyPreviewImage < Base
      end

      #
      # 0x2004 - Contrast
      #
      class SonyContrast < Base
      end

      #
      # 0x2005 - Saturation
      #
      class SonySaturation < Base
      end
      
      #
      # 0x200a - High Definition Range Mode
      #
      class SonyAutoHDR < Base
        def to_s
          case @formatted
          when 0x00000
            "Off"
          when 0x10001
            "Auto"
          when 0x10010
            "1"
          when 0x10012
            "2"
          when 0x10014
            "3"
          when 0x10016
            "4"
          when 0x10018
            "5"
          else
            "Unknown"
          end
        end

      end

      #
      # 0x3000 - Shot Information
      #
      class SonyShotInfo < Base
      end

      #
      # 0xb000 - File Format
      #
      class SonyFileFormat < Base
        FileFormat = {
          [0, 0, 0, 2] => "JPEG",
          [1, 0, 0, 0] => "SR2",
          [2, 0, 0, 0] => "ARW 1.0",
          [3, 0, 0, 0] => "ARW 2.0",
          [3, 1, 0, 0] => "ARW 2.1",
          [3, 2, 0, 0] => "ARW 2.2",
          [3, 3, 0, 0] => "ARW 2.3"
        }

        def to_s
          FileFormat.has_key?(@formatted) ? FileFormat[@formatted] : @formatted.to_s + " (Unknown)"
        end

      end

      #
      # 0xb001 - Sony Mode lD
      #
      class SonyModelID < Base

        ModelID = {
          2   => "DSC-R1",
          256 => "DSLR-A100",
          257 => "DSLR-A900",
          258 => "DSLR-A700",
          259 => "DSLR-A200",
          260 => "DSLR-A350",
          261 => "DSLR-A300",
          263 => "DSLR-A380",
          264 => "DSLR-A330",
          265 => "DSLR-A230",
          269 => "DSLR-A850",
          273 => "DSLR-A550",
          274 => "DSLR-A500",
          275 => "DSLR-A450",
          278 => "NEX-5",
          279 => "NEX-3",
          288 => "NEX-5N"
        }

        def to_s
          if ModelID.has_key?(@formatted)
            %Q[#{@formatted} (="#{ModelID[@formatted]}")]
          else
            %Q[#{@formatted} (Unknown ID)]
          end
        end
      end

      #
      # 0xb020 - Color Reproduction
      #
#     class SonyColorReproduction < Base
#     end

      #
      # 0xb021 - Color Temperature
      #
      class SonyColorTemperature < Base
      end

      #
      # 0xb022 - Color Compensation Filter
      #
      class SonyColorCompensationFilter < Base
        def to_s
          if @formatted < 0
            @formatted.to_s +  " (Green)"
          elsif @formatted > 0
            @formatted.to_s +  " (Magenta)"
          else
            @formatted.to_s
          end
        end
      end

      #
      # 0xb023 - Scene Mode
      #
      class SonySceneMode < Base

        SceneMode = {
          0  => "Standard",
          1  => "Portrait",
          2  => "Text",
          3  => "Night Scene",
          4  => "Sunset",
          5  => "Sports",
          6  => "Landscape",
          7  => "Night Portrait",
          8  => "Macro",
          9  => "Super Macro",
          16 => "Auto",
          17 => "Night View/Portrait"
       }

       def to_s
         SceneMode.has_key?(@formatted) ? SceneMode[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb024 - Zone Matching
     #
     class SonyZoneMatching < Base
       ZoneMatching = {
         0 => "ISO Setting Used",
         1 => "High Key",
         2 => "Low Key"
       }

       def to_s
         ZoneMatching.has_key?(@formatted) ? ZoneMatching[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb025 - Dynamic Range Optimizer
     #
     class SonyDynamicRangeOptimizer < Base
       DRangeOptimizer = {
         0  => "Off",
         1  => "Standard",
         2  => "Advanced Auto",
         3  => "Auto",
         8  => "Advanced Lv1",
         9  => "Advanced Lv2",
         10 => "Advanced Lv3",
         11 => "Advanced Lv4",
         12 => "Advanced Lv5",
         16 => "1",
         17 => "2",
         18 => "3",
         19 => "4",
         20 => "5"
       }

       def to_s
         DRangeOptimizer.has_key?(@formatted) ? DRangeOptimizer[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb026 - Image Stabilization
     #
     class SonyImageStabilization < Base
       def to_s
         case @formatted
         when 0
           "Off"
         when 1
           "On"
         else
           "Unknown"
         end
       end
     end

     #
     # 0xb027 - Lens ID
     #  (Tag's value is always "-1" on recent Sony DSC. See "LensModel" tag in SubIFD.
     class SonyLensID < Base
     end

     #
     # 0xb029 - Color Mode
     #
     class SonyColorMode < Base
       ColorMode = {
         0   => "Standard",
         1   => "Vivid Color",
         2   => "Portrait",
         3   => "Landscape",
         4   => "Sunset",
         5   => "Night View/Portrait",
         6   => "Black & White",
         7   => "AdobeRGB",
         12  => "Neutral",
         100 => "Neutral",
         101 => "Clear",
         102 => "Deep",
         103 => "Light",
         104 => "Night View",
         105 => "Autumn Leaves"
       }

       def to_s
         ColorMode.has_key?(@formatted) ? ColorMode[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb02b - Full Image Size
     #
     class SonyFullImageSize < Base
       def processData
         @formatted = []
         partition_data(@count) do |data|
           @formatted.push _formatData(data)
         end
       end

       def to_s
         %Q[#{@formatted[0]} x #{@formatted[1]}]
       end
     end

     #
     # 0xb02c - Preview Image Size
     #
     class SonyPreviewImageSize < Base
       def processData
         @formatted = []
         partition_data(@count) do |data|
           @formatted.push _formatData(data)
         end
       end
       
       def to_s
         %Q[#{@formatted[0]} x #{@formatted[1]}]
       end
     end

     #
     # 0xb040 - Macro
     #
     class SonyMacro < Base
       Macro = {
         0     => "Off",
         1     => "On",
         65535 => "n/a"
       }

       def to_s
         Macro.has_key?(@formatted) ? Macro[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb041 - Exposure Mode
     #
     class SonyExposureMode < Base
       ExposureMode = {
         0  => "Auto",
         1  => "Portrait",
         2  => "Beach",
         4  => "Snow",
         5  => "Landscape ",
         6  => "Program",
         7  => "Aperture priority",
         8  => "Shutter priority",
         9  => "Night Scene / Twilight",
         10 => "Hi-Speed Shutter",
         11 => "Twilight Portrait",
         12 => "Soft Snap",
         13 => "Fireworks",
         14 => "Smile Shutter",
         15 => "Manual",
         18 => "High Sensitivity",
         20 => "Advanced Sports Shooting",
         29 => "Underwater",
         33 => "Gourmet",
         34 => "Panorama",
         35 => "Handheld Twilight",
         36 => "Anti Motion Blur",
         37 => "Pet",
         38 => "Backlight Correction HDR"
       }

       def to_s
         ExposureMode.has_key?(@formatted) ? ExposureMode[@formatted] : @formatted.to_s + " (Unknown)"
       end

     end

     #
     # 0xb042 - Focus Mode
     #
     class SonyFocusMode < Base
       FocusMode = {
         1 => "AF-S",
         2 => "AF-C",
         4 => "Permanent-AF"
       }

       def to_s
         FocusMode.has_key?(@formatted) ? FocusMode[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb043 - AF Mode
     #
     class SonyAFMode < Base
       AFMode = {
         0  => "Default",
         1  => "Multi AF",
         2  => "Center AF",
         3  => "Spot AF",
         4  => "Flexible Spot AF",
         6  => "Touch AF",
         14 => "Manual Focus",
         15 => "Face Detected"
       }

       def to_s
         AFMode.has_key?(@formatted) ? AFMode[@formatted] : @formatted.to_s + " (Unknown)"
       end

     end

     #
     # 0xb044 - AF Illuminator
     #
     class SonyAFIlluminator < Base
       def to_s
         if @formatted == 0
           "Off"
         elsif @formatted == 1
           "Auto"
         else
           @formatted.to_s + " (Unknown)"
         end
       end
     end

     #
     # 0xb047 - JPEG Quality
     #
     class SonyJPEGQuality < Base
       def to_s
         case @formatted
         when 0
           "Normal"
         when 1
           "Fine"
         else
           @formatted.to_s + " (Unknown)"
         end
       end
     end

     #
     # 0xb048 - Flash Level
     #
     class SonyFlashLevel < Base
       FlashLevel = {
         -32768 => "Low",
         -1     => "n/a",
         0      => "Normal",
         32768  => "High"
       }

       def to_s
         FlashLevel.has_key?(@formatted) ? FlashLevel[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb049 - Release Mode
     #
     class SonyReleaseMode < Base
       ReleaseMode = {
         0 => "Normal",
         2 => "Burst",
         5 => "Exposure Bracketing",
         6 =>  "White Balance Bracketing"
       }

       def to_s
         ReleaseMode.has_key?(@formatted) ? ReleaseMode[@formatted] : @formatted.to_s + " (Unknown)"
       end
      end

      #
      # 0xb04a - Sequence Number
      #
      class SonySequenceNumber < Base
        def to_s
          if @formatted == 0
            "Single"
          else
            @formatted.to_s + " (Unknown)"
          end
        end
      end

      #
      # 0xb04b - Anti Blur
      #
      class SonyAntiBlur < Base
        AntiBlur = {
           0 => "Off",
           1 => "On (Continuous)",
           2 => "On (Shooting)"
         }

       def to_s
         AntiBlur.has_key?(@formatted) ? AntiBlur[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb04e - Long Exposure Noise Reduction
     #
     class SonyLongExposureNoiseReduction < Base
       def to_s
         if    @formatted == 0
           "Off"
         elsif @formatted == 1
           "On"
         else
           @formatted.to_s + " (Unknown)"
         end
       end
     end

     #
     # 0xb04f - Dynamic Range Optimizer (New)
     #
     class SonyDynamicRangeOptimizer2 < Base
       DynamicRangeOptimizer2 = {
         0 => "Off",
         1 => "Standard",
         2 => "Plus"
       }

       def to_s
         DynamicRangeOptimizer2.has_key?(@formatted) ? DynamicRangeOptimizer2[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb052 - Intelligent Auto
     #
     class SonyIntelligentAuto < Base
       IntelligentAuto = {
         0 => "Off",
         1 => "On",
         2 => "Advanced"
       }

       def to_s
         IntelligentAuto.has_key?(@formatted) ?  IntelligentAuto[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

     #
     # 0xb054 - WhiteBalance (New)
     #
     class SonyWhiteBalance2 < Base
       WhiteBalance2 = {
         0  => "Auto",
         4  => "Manual",
         5  => "Daylight",
         6  => "Cloudy",
         7  => "White Flourescent",
         8  => "Cool White Flourescent",
         9  => "Day White Flourescent",
         14 => "Incandescent",
         15 => "Flash",
         17 => "Underwater 1 (Blue Water)",
         18 => "Underwater 2 (Green Water)"
       }

       def to_s
         WhiteBalance2.has_key?(@formatted) ?  WhiteBalance2[@formatted] : @formatted.to_s + " (Unknown)"
       end
     end

   end

    SonyIFDTable = {
      0x0102 => MakerNote::SonyQuality,
      0x0104 => MakerNote::SonyFlashExposureComp,
      0x0105 => MakerNote::SonyTeleconverter,
      0x0112 => MakerNote::SonyWhiteBalanceFineTune,
      0x0114 => MakerNote::SonyCameraSettings,
      0x0115 => MakerNote::SonyWhiteBalance,
      0x0e00 => MakerNote::SonyPrintIM,
      0x1000 => MakerNote::SonyMultiBurstMode,
      0x1001 => MakerNote::SonyMultiBurstImageWidth,
      0x1002 => MakerNote::SonyMultiBurstImageHeight,
      0x1003 => MakerNote::SonyPanorama,
      0x2001 => MakerNote::SonyPreviewImage,
      0x2004 => MakerNote::SonyContrast,
      0x2005 => MakerNote::SonySaturation,
      0x200a => MakerNote::SonyAutoHDR,
      0x3000 => MakerNote::SonyShotInfo,
      0xb000 => MakerNote::SonyFileFormat,
      0xb001 => MakerNote::SonyModelID,
#     0xb020 => MakerNote::SonyColorReproduction,
      0xb021 => MakerNote::SonyColorTemperature,
      0xb022 => MakerNote::SonyColorCompensationFilter,
      0xb023 => MakerNote::SonySceneMode,
      0xb024 => MakerNote::SonyZoneMatching,
      0xb025 => MakerNote::SonyDynamicRangeOptimizer,
      0xb026 => MakerNote::SonyImageStabilization,
      0xb027 => MakerNote::SonyLensID,
      0xb029 => MakerNote::SonyColorMode,
      0xb02b => MakerNote::SonyFullImageSize,
      0xb02c => MakerNote::SonyPreviewImageSize,
      0xb040 => MakerNote::SonyMacro,
      0xb041 => MakerNote::SonyExposureMode,
      0xb042 => MakerNote::SonyFocusMode,
      0xb043 => MakerNote::SonyAFMode,
      0xb044 => MakerNote::SonyAFIlluminator,
      0xb047 => MakerNote::SonyJPEGQuality,
      0xb048 => MakerNote::SonyFlashLevel,
      0xb049 => MakerNote::SonyReleaseMode,
      0xb04a => MakerNote::SonySequenceNumber,
      0xb04b => MakerNote::SonyAntiBlur,
      0xb04e => MakerNote::SonyLongExposureNoiseReduction,
      0xb04f => MakerNote::SonyDynamicRangeOptimizer2,
      0xb052 => MakerNote::SonyIntelligentAuto,
      0xb054 => MakerNote::SonyWhiteBalance2
    }

  end

  class Sony

    def initialize(fin, tiff_origin, dataPos, byteOrder_module)
      @fin = fin
      @tiffHeader0 = tiff_origin
      @dataPos = dataPos
      @byteOrder_module = byteOrder_module
      self.extend @byteOrder_module
    end

    def scan_IFD
      #
      # Sony MakerNote starts from 12 byte from the origin
      #

      @fin.pos = @dataPos + 12

      #
      # get the number of tags
      #
      numDirs = decode_ushort(fin_read_n(2))

      #
      # now scan them
      #
      1.upto(numDirs) {
        curpos_tag = @fin.pos
        tag = parseTagID(fin_read_n(2))
        tagclass = Tag.find(tag.hex, Tag::SonyIFDTable)
        unit, formatter = Tag::Format::Unit[decode_ushort(fin_read_n(2))]
        count = decode_ulong(fin_read_n(4))
        tagdata = fin_read_n(4)

        obj = tagclass.new(tag, "MakerNote", count)
        obj.extend formatter, @byteOrder_module
        obj.pos = curpos_tag
        if unit * count > 4
          curpos = @fin.pos
          begin
            @fin.pos = @tiffHeader0 + decode_ulong(tagdata)
            obj.dataPos = @fin.pos
            obj.data = fin_read_n(unit*count)
          ensure
            @fin.pos = curpos
          end
        else
          obj.dataPos = @fin.pos - 4
          obj.data = tagdata
        end
        obj.processData
        yield obj
      }
    end

    private

    def fin_read_n(n)
      @fin.read(n)
    end

  end

end
