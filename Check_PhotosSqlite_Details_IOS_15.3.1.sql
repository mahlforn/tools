select ZADDITIONALASSETATTRIBUTES.Z_PK, ZADDITIONALASSETATTRIBUTES.ZASSET, ZADDITIONALASSETATTRIBUTES.ZIMPORTEDBYBUNDLEIDENTIFIER, ZADDITIONALASSETATTRIBUTES.ZEXIFTIMESTAMPSTRING, ZADDITIONALASSETATTRIBUTES.ZTIMEZONEOFFSET as 'ZTIMEZONEOFFSET (MIN)', ZADDITIONALASSETATTRIBUTES.ZMASTERFINGERPRINT, ZADDITIONALASSETATTRIBUTES.ZORIGINALFILENAME, ZADDITIONALASSETATTRIBUTES.ZPUBLICGLOBALUUID, ZADDITIONALASSETATTRIBUTES.ZTIMEZONENAME, ZADDITIONALASSETATTRIBUTES.ZIMPORTEDBYDISPLAYNAME, ZADDITIONALASSETATTRIBUTES.ZMEDIAMETADATATYPE, ZASSET.ZFILENAME, ZASSET.ZDIRECTORY, ZASSET.ZLOCATIONDATA, DateTime(ZASSET.ZDATECREATED + 978307200, 'UNIXEPOCH') as 'ZDATECREATED', ZASSET.ZDURATION as 'ZDURATION (S)', ZASSET.ZCLOUDLOCALSTATE  as 'ZCLOUDLOCALSTATE (Sync iCloud)', ZASSET.ZCLOUDASSETGUID, ZCLOUDMASTERMEDIAMETADATA.ZDATA as 'ZDATA (PLIST)', ZMOMENT.ZAPPROXIMATELATITUDE, ZMOMENT.ZAPPROXIMATELONGITUDE, ZMOMENT.ZTITLE, ZMOMENT.ZUUID, ZEXTENDEDATTRIBUTES.ZLENSMODEL, ZEXTENDEDATTRIBUTES.ZCODEC, ZEXTENDEDATTRIBUTES.ZCAMERAMODEL
from ZADDITIONALASSETATTRIBUTES
left JOIN ZASSET ON ZASSET.Z_PK = ZADDITIONALASSETATTRIBUTES.ZASSET
left JOIN ZCLOUDMASTER ON ZCLOUDMASTER.ZCLOUDMASTERGUID = ZADDITIONALASSETATTRIBUTES.ZMASTERFINGERPRINT
left JOIN ZCLOUDMASTERMEDIAMETADATA ON ZCLOUDMASTERMEDIAMETADATA.Z_PK = ZCLOUDMASTER.ZMEDIAMETADATA
left JOIN ZMOMENT on ZMOMENT.ZUUID = ZASSET.ZMOMENT
left JOIN ZEXTENDEDATTRIBUTES on ZEXTENDEDATTRIBUTES.ZASSET = ZASSET.Z_PK

-- Filename from i.g. /mobile/Media/PhotoData/CPL/storage/filecache/Acv/cplXXXXXXXXXXXXXXXXXXXXX.mp4
-- WHERE ZADDITIONALASSETATTRIBUTES.ZMASTERFINGERPRINT = 'XXXXXXXXXXXXXXXXXXXXX'