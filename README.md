Models of Orientation Tuning (BUILDING IN PROGRESS)

<u>Some Original Source References</u>

- See ***Linearity Section*** from [notes on spectral analysis](/Users/luis/Box/boxNOTES/ntsSPECTRAL)

- See  [notes on types of Visual Models](/Users/luis/Box/boxNOTES/ntsMODELS)

# Orientation Tuning in V1

## Properties of Individual Cells 

All known mammals [] have visual neurons, or 'units', that are *tuned* to the orientation of an elongated stimulus that lands on their receptive fields (RFs). These are some key properties of these 'orientation' tuned units...  

> Each unit has a "preferred orientation," that is, it responds best to one particular stimulus orientation. Different units have different preferred orientation preference
>
> The strength of a unit's response is inversely related to the difference between the unit's preferred orienation and the motion direction of the stimulus:
>
> - although a unit responds best to a stimulus having the appropriate orientation (i.e., the unit's "preferred orientation"), it will also respond, though less strongly, to orientations that slightly deviate from its preferred orienation.
> - The unit completely fails to respond to the movement if this difference becomes too large.
>
> Note: this description is based on the one described by Coltheart 1971





*Why are such units tuned to orientation?* Despite decades of research, our understanding of orientation tuning remains incomplete. At least two approaches are taken to understand the topic. (1) First, is to focus on the *function* of orientation tuning, namely how it influences downstream visual processes and how it benefits perception and behavior (2) Another approach is to focus on how orientation tuning is generated, or *implemented*, by the units that make up the early visual system (i.e. the retina, thalamus, and V1) of mammals. Both of these approaches are needed to aquire a complete understanding orientation tuning. 

Here I focus a model, which attempts to explain how tuning is implemented, with less emphasis function. 

# The Dipole Model 

So why are cells tuned to stimulus orientation? The dipole model - inspired by the work of Hubel and Weisel (1962) -  asserts that untuned, slightly spatially displaced ON and OFF signals converge onto common V1 unit target, endowing the unit with orientation tuning. 



## Contrast Polarity Tuning

### Retina

RGCs are *tuned*, or *selective*, to specific features of a stimulus that lands on their RFs 8,13. Center surround RGCs, for example, are tuned to polarity; that is, they are selective to the spatial and temporal contrast of a stimulus (i.e., changes in luminance across space and time). ON center-surround RGCs respond best to a stimulus that increases in luminance (e.g., the appearance of a *bright spot* one a dark background), while OFF center RGCs respond best to luminance decrements (e.g., the appearance of a *dark spot* on a bright background) 6,18. These center surround cells come in two flavors: those with sustained temporal response, and those with transient responses 19.  Polarity tuned RGCs are found in the retinas of all mammals 20. 

### Retino-thalamic Network

The mouse retina contains center-surround RGCs that respond best to either the onset or offset of a circular stimulus and can have sustained or transient temporal responses  6,7,17,19. The axonal afferents of these center-surround RGCs targeting the dLGN are relatively large 34, and innervate all regions of the dLGN, especially the medial part of the dLGN, known as the *core* 29,38,39 (**Figure 5**).

### dLGN

Neurons in the dLGN have ON or OFF center-surround RFs 34,45,47,48, much like those in the retina. Center surround cells make up the majority of cells in dLGN 30,34,45-48, although they are a minority (~5%) in the retina suggesting that the vast majority of dLGN inputs come from these center-surround RGCs 34. The dLGN core region, in particular, houses a large proportion of these center-surround cells 34,39,48 **(****Figure 5****)**.

The RFs of center surround dLGN cells have circular central subregions 34,46,47 that, generally, are surrounded by an annulus with an opposite preference for contrast polarity 34,48. Stimulation of their central subregion can elicit a sustained, transient, monophasic 34, or biphasic 34,48,49 temporal response. Moreover, these center-surround dLGN cells are *not* selective to the direction of a stimulus moving across their RF 34,47,48. Many the spatial and temporal response properties of center-surround dLGN neurons are similar to those of center surround RGCs.

### Thalamocortical Network

Both direction selective 39 and ON/OFF center 39,49,65 dLGN neurons innervate mouse V1. The dLGN core, which populated by center surround cells, appears to preferentially target V1 neurons in layer 439, while the direction tuned shell region of the dLGN sends its axons to the superficial layers V1 39 (although this dichotomy is not absolute 54). Tuned dLGN neurons 9,33,34,45,48,53 and their axonal projections to V1 39,54 also show a biased preferences towards cardinal orientations 54,68.

### Visual Cortex

#### Polarity

The response of a simple cell in V1 can be elicited by two types of stimuli that fall within its spatial RF: a stimulus that increases its luminance (e.g., a bright spot) and one that decreases its luminance (e.g., dark spot). The ON subregion defines to portion of the RF that, when a bright spot appears, triggers a neural response. The OFF subregion is defined in a similar manner but with a dark stimulus. In simple cells, these two regions are usually spatially displaced (see below). The RFs of mouse V1 neurons often contain one to three localized subregions  65,73,74,81-86 (**Figure 8**). Furthermore, the RFs of most L2/3 neurons contain two ON and OFF subregions, whereas those of L4 cells are dominated by only one type of polar contrast 83,85 **(****Figure 8****).**

#### Polarity Vs. Orientation

The subfields of cells in L2/3 can show some separation or be largely overlapping 82-84 while those of inhibitory neurons nearly always overlap 84,85 **(****Figure 8****).** In mouse V1, L2/3 cells with separate, side-by-side ON and OFF subfields 82,83 have sharper orientation tuning compared to those with overlapping subfields 83 (**Figure 8****)**. Moreover, RFs of V1 cells in mice tend to have an elongated, elliptical structure 63-65,73,81-83 and these elliptical RFs can generally take on any orientation 64,65,81,86(**Figure 7****,** **Figure 8****)** reflecting the diversity of orientation preferences of V1 neurons 54,81. Moreover, the RF structure of V1 cells can predict how they respond to the orientations of gratings 65,81. Consistent with this notion, the neurons in deeper layers are have more symmetric RFs 63, and are less likely to be orientation tuned 81. Similar to mice, orientation tuning of V1 neurons in other mammals can be predicted by the spatial arrangement of their ON-OFF subfields 50,95-99. 

#### Simple vs Complex Cells

Some V1 neurons respond to the onset and offset of a stimulus in slightly separate locations of visual space, and the angle formed by the centers of the subfields can predict their orientation preference. These cells tend to show ‘linear’ response properties and traditionally are referred to as ‘simple’ cells. Those that respond both the onset and offset of a stimulus within the same visual field location tend to show non-linear responses and are referred to as complex cells 100 . However , this dichotomization is not absolute and is instead one of degree. In primates and carnivores simple cells dominate thalamic input L4, while those in upper layers are mostly complex 89 . In mice both L2/3 and L4 are dominated by simple cells, but a fair percentage of complex cells appear in both layers as well 81 .

## Key Take Away

#### Version 1

In cats and primates, orientation tuning of a V1 cell is well predicted by the spatial arrangement of its ON-OFF subfields [51,109-111]

Moreover, in tree shrews, the combined set of ON and OFF thalamic inputs to a V1 cortical column, weighted by their input strengths, generate a ‘population’ thalamic RF with spatially offset subfields that can accurately predict the orientation of of the cortical columns (Jin 2011). 

The relationship between the polar structure of RFs and orientation tuning is also evident evident in mouse V1. In mice, L2/3 cells with side-by-side ON and OFF subfields 85,86 have sharper orientation tuning compared to those with overlapping subfields 86 (**Figure 8****)**. Moreover, RFs of V1 cells in mice tend to have an elongated, elliptical structure 64,68,69,75,84-86 and these elliptical RFs can generally take on any orientation 68,69,84,89(**Figure 7****,** **Figure 8****),** reflecting the diversity of orientation preferences obversed in mouse V155,84. In turn, the orientation of V1 RFs can predict the orientation preference of the V1 cell estimated with gratings 69,84. 

This strong relationship - between the local RF structure and the tuning of a cell - is unprecedented given the differences in V1 of rodents and other mammals. For example, the RFs of mouse V1 cells are much larger than those of cats and primates 33,91. Moreover, mouse V1 exhibits a salt and pepper organization of orientation preferences, unlike the orderly orientation maps of V1 in higher mammals. Thus, the localized spatial structure, or the side-by-side arrangement of ON-OFF subfields of V1 cells, should play a crucial role in cortical orientation tuning across species.

#### Version 2

In mice, the RF of thalamic neurons and their V1 targets also show strong resemblances, and relationship between the structure of their subfields and the orientation tuning is also evident (**see Space vs Polarity vs Orientation Section**). Moreover, orientation selectivity of subthreshold activity is conserved during suppression intracortical inputs (Lien 2013). 

This strong relationship - between the local RF structure and the tuning of V1 cell - is unprecedented given the differences in V1 of rodents and other mammals. Mouse V1 cells have larger RFs 33,91, and they exhibit a salt and pepper organization of orientation preferences (Ohki 2007), compared other mammals. Thus, the side-by-side arrangement of ON-OFF subfields of V1 cells plays a crucial role in shaping cortical orientation tuning across species.

 The tuning width of simple cells appears to depends on aspect ratio of the RFs, with higher ratios leading to sharper tuning (Fin 2007[[LJ7\]](#_msocom_7) ), consistent with the idea that tuning is shaped by linear combination of inputs. The aspect ratio of V1 RFs neurons are greater in deeper layers (Jin 2016), as do the percent of cells with broader tuning (Niell 2008). Moreover, the tuning widths of V1 neurons in mice and higher mammals is remarkably similar (Hooser 2007), consistent with the asymmetries of their receptive fields.

That all mammals rely on the polar structure of the visual image makes the mammalian visual system efficient. Tuning of ON and OFF polarity signals, by themselves serve an important role for vision and behavior (), and in addition these two simple signals can generate novel tuning properties such as orientation tuning which is also functionally important.

<u>See your notebooks for quotes and references to these ideas</u>

- Wassle 1981: spatial summation of V1 cells, along the RF length, evidence that retinal cells with overlapping RFs are driving the nueron[[LJ1\]](#_msocom_1) 
- Niel 2008: Tuning Width and Subunit number are related [[LJ2\]](#_msocom_2) 
- Jin 2011: more evidence of predicting ori from on/off arrangment[[LJ3\]](#_msocom_3) : 
-  [[LJ3\]](#_msoanchor_3)ON-OFF receptive field and cortical orientation

- Suresh 2016: more evidence in cat, rodent, primate about ori~subfield arrangment[[LJ4\]](#_msocom_4) 

## The Dipole Model of Orientation Tuning 

**HIGHER MAMMALS EVIDENCE**

Moreover, these units respond to increments and decrements in luminance in slightly separate regions of their receptive fields, and the angle formed by the centers of these regions can predict their preferred orientation.

The original argument for the classical model of tuning came from the observations that RFs of orientation tuned cells in V1 contain spatially displaced ON and OFF subfields that qualitatively resemble the center-surround RFs of geniculate neurons (see mouse V1 orientation section).

 Moreover, suppressing cortical activity does not eliminate the selectivity of the subthreshold response of a cortical neurons (Ferster 1996, 1998[[LJ1\]](#_msocom_1) , Finn 2007). 

 RF properties of connected thalamo-cortical cell pairs match in their polarity and spatial tuning (Reid and Alonzo 1995, 2001), and orientation tuning of cortical is can be predicted by the spatial arrangement of its ON-OFF subfields 51,103-105,123,124.

 The tuning width of simple cells appears to depends on aspect ratio of the RFs, with higher ratios leading to sharper tuning (Fin 2007[[LJ2\]](#_msocom_2) ), consistent with the idea that tuning is shaped by linear combination of inputs.

 Wassle 1981: spatial summation of V1 cells, along the RF length, evidence that retinal cells with overlapping RFs are driving the nueron[[LJ3\]](#_msocom_3) 

 

Jin 2011: more evidence of predicting ori from on/off arrangment[[LJ4\]](#_msocom_4) : 

Suresh 2016: more evidence in cat, rodent, primate about ori~subfield arrangment[[LJ5\]](#_msocom_5) 

 



 

 



