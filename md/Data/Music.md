# Music

There are many music formats supported by GZDoom. Currently, all of
the music code is in its own submodule, *ZMusic*. The music system
supports many types of MIDI, tracker, emulated chip, OPL, and PCM
audio formats.

<span class="label label-yellow">Until 4.4.0</span> Additionally,
ZMusic also supports playing redbook audio via a CD drive, or through
a CDDA dump of one.

This page links to sources for the specifications of each format, and
pages for general information on them. You probably only need the
latter.

All music formats can be put in a GZip container, saving space in some
situations.

<div class=toc>
<!-- toc -->
</div>

## Ordering

ZMusic has a concept of *song order* for multi-track files. The way
this works depends on the format, so we will go over each format's
handling individually.

* CD Audio is divided into tracks.
* Most tracker formats have a concept of sub-songs. This will depend
  on the tracker format.
* The AY, GBS, HES, KSS, NSF, NSFe, and SAP formats all support
  multiple data tracks.
* Standard MIDI and XMI have a concept of sub-songs.

## Formats

### PCM Audio Formats

Supported PCM audio formats include:

* AIFF, AIFC[^aiff-spec][^aiff-info]
* CDDA[^cdda-spec][^cdda-info] <span>Until 4.4.0</span>{:.label.label-yellow}
* FLAC[^flac-spec][^flac-info]
* MPEG 1.0, 2.0, 2.5 Layer I, II, III Audio (MP2,
  MP3)[^mpeg-spec][^mpeg-info]
* Microsoft WAVE[^mswave-spec][^mswave-info]
* Ogg Vorbis[^ogg-spec][^ogg-info]

More obscure, but supported, PCM formats include:

* 8SVX[^8svx-spec][^8svx-info]
* AU, SND[^au-spec][^au-info]
* CAF[^caf-spec][^caf-info]
* Creative VOC[^voc-spec][^voc-info]
* Ensoniq PARIS Audio[^paris-spec][^paris-info]
* FastTrackerII XI[^xi-spec][^xi-info]
* GNU Octave MAT4 and MAT5[^mat-spec][^mat-info]
* HTK[^htk-spec][^htk-info]
* Headerless WAVE
* IRCAM Soundfile[^ircam-spec][^ircam-info]
* NIST SPHERE WAV[^nistwave-spec][^nistwave-info]
* PlayStation XA[^xa-spec][^xa-info]
* Portable Voice Format[^pvf-spec][^pvf-info]
* SD2[^sd2-spec][^sd2-info]
* Sony Wave64[^w64-spec][^w64-info]

### OPL Formats

Supported OPL formats include:

* DRO[^dro-spec][^dro-info]
* IMF[^imf-spec][^imf-info]
* RAW[^raw-spec][^raw-info]

### Emulated Formats

Supported emulated formats include:

* AY[^ay-spec][^ay-info]
* GBS[^gbs-spec][^gbs-info]
* GYM[^gym-spec][^gym-info]
* HES[^hes-spec][^hes-info]
* KSS[^kss-spec][^kss-info]
* NSF[^nsf-spec][^nsf-info]
* NSFe[^nsfe-spec][^nsfe-info]
* SAP[^sap-spec][^sap-info]
* SPC[^spc-spec][^spc-info]
* VGM, VGZ[^vgm-spec][^vgm-info]

### Tracker Formats

Supported tracker formats include:

* 669[^669-spec][^669-info]
* AMF[^amf-spec][^amf-info]
* DSM[^dsm-spec][^dsm-info]
* IT[^it-spec][^it-info]
* MOD[^mod-spec][^mod-info]
* MTM[^mtm-spec][^mtm-info]
* OKT[^okt-spec][^okt-info]
* PSM, PSM16[^psm-spec][^psm-info]
* PTM[^ptm-spec][^ptm-info]
* RIFF AMFF, RIFF AM[^amff-spec][^amff-info]
* S3M[^s3m-spec][^s3m-info]
* STM[^stm-spec][^stm-info]
* XM[^xm-spec][^xm-info]

### MIDI Formats

Supported MIDI formats include:

* HMI, HMP[^hmi-spec][^hmi-info]
* MUS[^mus-spec][^mus-info]
* Standard MIDI[^midi-spec][^midi-info]
* XMI[^xmi-spec][^xmi-info]

[^669-info]: <https://battleofthebits.org/lyceum/View/Composer+669/>

[^669-spec]: <http://www.textfiles.com/programming/FORMATS/669-form.pro>

[^8svx-info]: <https://en.wikipedia.org/wiki/8SVX>

[^8svx-spec]: <https://web.archive.org/web/20091121223006/http://amigan.1emu.net/reg/8SVX.txt>

[^aiff-info]: <https://en.wikipedia.org/wiki/Audio_Interchange_File_Format>

[^aiff-spec]: <https://web.archive.org/web/20071219035740/http://www.cnpbagwell.com/aiff-c.txt>

[^amf-info]: <http://www.vgmpf.com/Wiki/index.php?title=AMF>

[^amf-spec]: <http://www.usecode.org/pentagram/doxygen/amf2mod_8c-source.html>

[^amff-info]: <http://www.shikadi.net/moddingwiki/Jazz_2_Music_Format>

[^amff-spec]: <https://github.com/kode54/dumb/blob/master/src/it/readam.c>

[^au-info]: <https://en.wikipedia.org/wiki/Au_file_format>

[^au-spec]: <https://pubs.opengroup.org/external/auformat.html>

[^ay-info]: <http://www.vgmpf.com/Wiki/index.php?title=AY>

[^ay-spec]: <https://vgmrips.net/wiki/AY_File_Format>

[^caf-info]: <https://en.wikipedia.org/wiki/Core_Audio_Format>

[^caf-spec]: <https://developer.apple.com/library/archive/documentation/MusicAudio/Reference/CAFSpec/CAF_intro/CAF_intro.html>

[^cdda-info]: <https://en.wikipedia.org/wiki/Compact_Disc_Digital_Audio>

[^cdda-spec]: <https://webstore.iec.ch/preview/info_iec60908%7Bed2.0%7Db.pdf>

[^dro-info]: <http://www.vgmpf.com/Wiki/index.php?title=DRO>

[^dro-spec]: <http://www.shikadi.net/moddingwiki/DRO_Format>

[^dsm-info]: <http://www.shikadi.net/moddingwiki/DSIK_Module_Format>

[^dsm-spec]: <http://www.shikadi.net/moddingwiki/DSIK_Module_Format#File_format>

[^flac-info]: <https://xiph.org/flac/>

[^flac-spec]: <https://xiph.org/flac/format.html>

[^gbs-info]: <http://www.vgmpf.com/Wiki/index.php?title=GBS>

[^gbs-spec]: <http://mab.greyserv.net/f/gbs.txt>

[^gym-info]: <http://www.vgmpf.com/Wiki/index.php?title=GYM>

[^gym-spec]: <http://fileformats.archiveteam.org/wiki/GYM#Information>

[^hes-info]: <http://www.vgmpf.com/Wiki/index.php?title=HES>

[^hes-spec]: <http://www.purose.net/befis/download/nezplug/hesspec.txt>

[^hmi-info]: <http://www.vgmpf.com/Wiki/index.php?title=HMI>

[^hmi-spec]: <http://mab.greyserv.net/f/hmi.txt>

[^htk-info]: <http://htk.eng.cam.ac.uk/>

[^htk-spec]: <https://github.com/erikd/libsndfile/blob/7ea3f9d8746000cc82c016d0b5d48452bb80e9fe/src/htk.c#L143>

[^imf-info]: <http://www.vgmpf.com/Wiki/index.php?title=IMF>

[^imf-spec]: <http://www.shikadi.net/moddingwiki/IMF_Format>

[^ircam-info]: <http://fileformats.archiveteam.org/wiki/Berkeley/IRCAM/Carl_Sound_Format>

[^ircam-spec]: <http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/IRCAM/IRCAM.html>

[^it-info]: <https://en.wikipedia.org/wiki/Impulse_Tracker#IT_file_format>

[^it-spec]: <https://wiki.openmpt.org/Development:_Formats/IT>

[^kss-info]: <http://www.vgmpf.com/Wiki/index.php?title=KSS>

[^kss-spec]: <http://www.purose.net/befis/download/nezplug/kssspec.txt>

[^mat-info]: <https://www.gnu.org/software/octave/>

[^mat-spec]: <https://www.mathworks.com/help/pdf_doc/matlab/matfile_format.pdf>

[^midi-info]: <http://www.vgmpf.com/Wiki/index.php?title=MIDI>

[^midi-spec]: <https://web.archive.org/web/20070104033706/http://www.cybermuff.cz/music/MIDIspec.htm>

[^mod-info]: <https://en.wikipedia.org/wiki/MOD_(file_format)>

[^mod-spec]: <https://www.aes.id.au/modformat.html>

[^mpeg-info]: <https://en.wikipedia.org/wiki/MP3>

[^mpeg-spec]: <https://webstore.iec.ch/preview/info_isoiec11172-3%7Bed1.0%7Den.pdf>

[^mswave-info]: <https://en.wikipedia.org/wiki/WAV>

[^mswave-spec]: <https://web.archive.org/web/20080113195252/http://www.borg.com/~jglatt/tech/wave.htm>

[^mtm-info]: <https://www.pouet.net/prod.php?which=13362>

[^mtm-spec]: <http://swag.outpostbbs.net/SOUND/0069.PAS.html>

[^mus-info]: <http://www.vgmpf.com/Wiki/index.php?title=MUS>

[^mus-spec]: <http://www.shikadi.net/moddingwiki/MUS_Format>

[^nistwave-info]: <https://www.isip.piconepress.com/projects/speech/software/tutorials/production/fundamentals/v1.0/section_02/s02_01_p04.html>

[^nistwave-spec]: <https://www.isip.piconepress.com/projects/speech/software/tutorials/production/fundamentals/v1.0/section_02/text/nist_sphere.text>

[^nsf-info]: <http://www.vgmpf.com/Wiki/index.php?title=NSF>

[^nsf-spec]: <http://wiki.nesdev.com/w/index.php/NSF>

[^nsfe-info]: <http://www.vgmpf.com/Wiki/index.php?title=NSFE>

[^nsfe-spec]: <http://wiki.nesdev.com/w/index.php/NSFe>

[^ogg-info]: <https://xiph.org/vorbis/>

[^ogg-spec]: <https://xiph.org/vorbis/doc/Vorbis_I_spec.html>

[^okt-info]: <http://www.vgmpf.com/Wiki/index.php?title=Oktalyzer>

[^okt-spec]: <http://www.textfiles.com/programming/FORMATS/okt-form.txt>

[^paris-info]: <https://en.wikipedia.org/wiki/Ensoniq_PARIS>

[^paris-spec]: <https://raw.githubusercontent.com/erikd/libsndfile/7ea3f9d8746000cc82c016d0b5d48452bb80e9fe/src/paf.c>

[^psm-info]: <http://www.shikadi.net/moddingwiki/ProTracker_Studio_Module>

[^psm-spec]: <http://www.shikadi.net/moddingwiki/ProTracker_Studio_Module>

[^ptm-info]: <http://fileformats.archiveteam.org/wiki/PTM>

[^ptm-spec]: <https://web.archive.org/web/20151027135201/http://hackipedia.org/File%20formats/Music/Sample%20based/text/Poly%20Tracker%20module%20format.cp437.txt.utf-8.txt>

[^pvf-info]: <https://raw.githubusercontent.com/msekletar/mgetty/master/voice/doc/Readme.pvftools>

[^pvf-spec]: <https://raw.githubusercontent.com/msekletar/mgetty/93f1ef77ed562644d630fccdfd59d95d1f08373f/voice/include/pvf.h>

[^raw-info]: <http://www.vgmpf.com/Wiki/index.php?title=RAW_(Rdos)>

[^raw-spec]: <http://www.shikadi.net/moddingwiki/RAW_Format_(Adlib)>

[^s3m-info]: <https://en.wikipedia.org/wiki/S3M_(file_format)>

[^s3m-spec]: <http://www.textfiles.com/programming/FORMATS/s3m-form.txt>

[^sap-info]: <http://www.vgmpf.com/Wiki/index.php?title=SAP>

[^sap-spec]: <http://asap.sourceforge.net/sap-format.html>

[^sd2-info]: <https://en.wikipedia.org/wiki/Avid_Audio#Sound_Designer_file_formats>

[^sd2-spec]: <https://raw.githubusercontent.com/erikd/libsndfile/7ea3f9d8746000cc82c016d0b5d48452bb80e9fe/src/sd2.c>

[^spc-info]: <http://www.vgmpf.com/Wiki/index.php?title=SPC>

[^spc-spec]: <https://wiki.superfamicom.org/spc-and-rsn-file-format>

[^stm-info]: <https://en.wikipedia.org/wiki/Scream_Tracker>

[^stm-spec]: <http://mab.greyserv.net/f/stm.txt>

[^vgm-info]: <http://www.vgmpf.com/Wiki/index.php?title=VGM>

[^vgm-spec]: <https://www.smspower.org/Music/VGMFileFormat>

[^voc-info]: <https://en.wikipedia.org/wiki/Creative_Voice_file>

[^voc-spec]: <http://sox.sourceforge.net/AudioFormats-11.html#ss11.5>

[^w64-info]: <http://blog.bjornroche.com/2009/11/wave64-vs-rf64-vs-caf.html>

[^w64-spec]: <http://mab.greyserv.net/f/sony_wave64.pdf>

[^xa-info]: <https://wiki.vg-resource.com/PlayStation#XA>

[^xa-spec]: <http://problemkaputt.de/psx-spx.htm#cdromxaaudioadpcmcompression>

[^xi-info]: <https://en.wikipedia.org/wiki/FastTracker_2#Files>

[^xi-spec]: <http://mab.greyserv.net/f/xm.txt>

[^xm-info]: <https://en.wikipedia.org/wiki/XM_%28file_format%29>

[^xm-spec]: <http://zzo38computer.org/textfile/music/xm-form.txt>

[^xmi-info]: <http://www.vgmpf.com/Wiki/index.php?title=XMI>

[^xmi-spec]: <http://www.shikadi.net/moddingwiki/XMI_Format>
