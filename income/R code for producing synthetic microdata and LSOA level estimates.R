## Format individual adult survey table
raw_ind_full <- read.csv("~/Desktop/Microsimulation/raw_ind_full.csv")
View(raw_ind_full)
ind <- raw_ind_full[,c("pidp","sex","age","ecostatus","hiqualif","marstat","ethnicity","hhtype","tenure")]
head(ind)
ind_orig <- ind
ind$sex[ind$sex==1] <- "M" # rename sex indicators 1/2 to M/F
ind$sex[ind$sex==2] <- "F"
brks <- c(15,24,34,49,64,74,100)
cut(ind$age, breaks = brks)
labs <- c("16_24","25_34","35_49","50_64","65_74","75+")
cut(ind$age, breaks = brks, labels = labs)
ind$age <- cut(ind$age, breaks = brks, labels = labs) # bin the age variable
ind$sex_age <- as.character(paste(ind$sex, ind$age, sep='_')) # generate categorical variable of sex by age
ind$ecostatus[ind$ecostatus==1] <- "self_employed" # rename and re-categorise economic status
ind$ecostatus[ind$ecostatus==2] <- "in_paid_employment"
ind$ecostatus[ind$ecostatus==3] <- "unemployed"
ind$ecostatus[ind$ecostatus==4] <- "retired"
ind$ecostatus[ind$ecostatus==5] <- "others"
ind$ecostatus[ind$ecostatus==6] <- "looking_after_home"
ind$ecostatus[ind$ecostatus==7] <- "student"
ind$ecostatus[ind$ecostatus==8] <- "long_term_sick/disabled"
ind$ecostatus[ind$ecostatus==9] <- "others"
ind$ecostatus[ind$ecostatus==10] <- "others"
ind$ecostatus[ind$ecostatus==11] <- "others"
ind$ecostatus[ind$ecostatus==97] <- "others"
ind$hiqualif[ind$hiqualif==1] <- "Level_4/above" # re-categorise highest qualification levels
ind$hiqualif[ind$hiqualif==2] <- "Level_4/above"
ind$hiqualif[ind$hiqualif==3] <- "Level_3"
ind$hiqualif[ind$hiqualif==4] <- "Level_2/1"
ind$hiqualif[ind$hiqualif==5] <- "Others"
ind$hiqualif[ind$hiqualif==9] <- "None"
ind$marstat[ind$marstat==1] <- "single" # re-categorise marital status
ind$marstat[ind$marstat==2] <- "married"
ind$marstat[ind$marstat==3] <- "civil_partner"
ind$marstat[ind$marstat==4] <- "separated"
ind$marstat[ind$marstat==5] <- "divorced"
ind$marstat[ind$marstat==6] <- "widowed/surviving"
ind$marstat[ind$marstat==7] <- "separated"
ind$marstat[ind$marstat==8] <- "divorced"
ind$marstat[ind$marstat==9] <- "widowed/surviving"
ind$ethnicity[ind$ethnicity==1] <- "White" # re-categorise ethnic group
ind$ethnicity[ind$ethnicity==2] <- "White"
ind$ethnicity[ind$ethnicity==3] <- "White"
ind$ethnicity[ind$ethnicity==4] <- "White"
ind$ethnicity[ind$ethnicity==5] <- "Mixed"
ind$ethnicity[ind$ethnicity==6] <- "Mixed"
ind$ethnicity[ind$ethnicity==7] <- "Mixed"
ind$ethnicity[ind$ethnicity==8] <- "Mixed"
ind$ethnicity[ind$ethnicity==9] <- "Asian"
ind$ethnicity[ind$ethnicity==10] <- "Asian"
ind$ethnicity[ind$ethnicity==11] <- "Asian"
ind$ethnicity[ind$ethnicity==12] <- "Asian"
ind$ethnicity[ind$ethnicity==13] <- "Asian"
ind$ethnicity[ind$ethnicity==14] <- "Black"
ind$ethnicity[ind$ethnicity==15] <- "Black"
ind$ethnicity[ind$ethnicity==16] <- "Black"
ind$ethnicity[ind$ethnicity==17] <- "Others"
ind$ethnicity[ind$ethnicity==97] <- "Others"
ind$tenure[ind$tenure==1] <- "owned_outright" # re-categorise and label tenure types
ind$tenure[ind$tenure==2] <- "owned_mortgage"
ind$tenure[ind$tenure==3] <- "social_rented"
ind$tenure[ind$tenure==4] <- "social_rented"
ind$tenure[ind$tenure==5] <- "private_rented"
ind$tenure[ind$tenure==6] <- "private_rented"
ind$tenure[ind$tenure==7] <- "private_rented"
ind$tenure[ind$tenure==8] <- "others"
ind$hhtype[ind$hhtype==1] <- "1_adu_no_child" # re-categorise and label type of household composition
ind$hhtype[ind$hhtype==2] <- "1_adu_no_child"
ind$hhtype[ind$hhtype==3] <- "1_adu_no_child"
ind$hhtype[ind$hhtype==4] <- "1_adu_child"
ind$hhtype[ind$hhtype==5] <- "1_adu_child"
ind$hhtype[ind$hhtype==6] <- "1_couple_no_child"
ind$hhtype[ind$hhtype==8] <- "1_couple_no_child"
ind$hhtype[ind$hhtype==10] <- "1_couple_child"
ind$hhtype[ind$hhtype==11] <- "1_couple_child"
ind$hhtype[ind$hhtype==12] <- "1_couple_child"
ind$hhtype[ind$hhtype==16] <- "others_no_child"
ind$hhtype[ind$hhtype==17] <- "others_no_child"
ind$hhtype[ind$hhtype==18] <- "others_child"
ind$hhtype[ind$hhtype==19] <- "others_no_child"
ind$hhtype[ind$hhtype==20] <- "others_child"
ind$hhtype[ind$hhtype==21] <- "others_child"
ind$hhtype[ind$hhtype==22] <- "others_no_child"
ind$hhtype[ind$hhtype==23] <- "others_child"

## Format individual child survey table
ind_child <- read.csv("~/Desktop/Microsimulation/ind_child.csv")
ind_child$sex[ind_child$sex==1] <- "M" # rename sex indicators 1/2 to M/F
ind_child$sex[ind_child$sex==2] <- "F"
brks <- c(0,4,11,15)
cut(ind_child$age, breaks = brks)
labs <- c("0_4","5_11","12_15")
cut(ind_child$age, breaks = brks, labels = labs)
ind_child$sex_age <- as.character(paste(ind_child$sex, ind_child$age, sep='_')) # generate categorical variable of sex by age

## Format sex/age constraint table
# Format sex/age tables for England and Wales 
sex_age_EW <- read.csv("~/Desktop/Microsimulation/sex_age_EW.csv")
sex_age_EW_orig <- sex_age_EW
ageNames <- c("M_0_4", "M_5_11",  "M_12_15", "M_16_24", "M_25_34", "M_35_49", "M_50_64", "M_65_74", "M_75+",
              "F_0_4", "F_5_11", "F_12_15", "F_16_24", "F_25_34", "F_35_49", "F_50_64", "F_65_74", "F_75+") # expected output
rawNames <- sex_age_EW[1,]
names(sex_age_EW)

selm1 <- seq(2, 6, by = 1)
rawNames[selm1]
assign(x = ageNames[1], value = rowSums(sex_age_EW[,selm1]))

con_sex_age_1 <- data.frame(matrix(nrow = nrow(sex_age_EW), ncol = length(ageNames)))
names(con_sex_age_1) <- ageNames
con_sex_age_1[1] <- rowSums(sex_age_EW[selm1])

selm2 <- seq(7, 13, by = 1)
assign(x = ageNames[2], value = rowSums(sex_age_EW[,selm2]))
con_sex_age_1[2] <- rowSums(sex_age_EW[selm2])

selm3 <- seq(14, 17, by = 1)
assign(x = ageNames[3], value = rowSums(sex_age_EW[,selm3]))
con_sex_age_1[3] <- rowSums(sex_age_EW[selm3])

selm4 <- seq(18, 26, by = 1)
assign(x = ageNames[4], value = rowSums(sex_age_EW[,selm4]))
con_sex_age_1[4] <- rowSums(sex_age_EW[selm4])

selm5 <- seq(27, 36, by = 1)
assign(x = ageNames[5], value = rowSums(sex_age_EW[,selm5]))
con_sex_age_1[5] <- rowSums(sex_age_EW[selm5])

selm6 <- seq(37, 51, by = 1)
assign(x = ageNames[6], value = rowSums(sex_age_EW[,selm6]))
con_sex_age_1[6] <- rowSums(sex_age_EW[selm6])

selm7 <- seq(52, 66, by = 1)
assign(x = ageNames[7], value = rowSums(sex_age_EW[,selm7]))
con_sex_age_1[7] <- rowSums(sex_age_EW[selm7])

selm8 <- seq(67, 76, by = 1)
assign(x = ageNames[8], value = rowSums(sex_age_EW[,selm8]))
con_sex_age_1[8] <- rowSums(sex_age_EW[selm8])

selm9 <- seq(77, 92, by = 1)
assign(x = ageNames[9], value = rowSums(sex_age_EW[,selm9]))
con_sex_age_1[9] <- rowSums(sex_age_EW[selm9])

self1 <- seq(93, 97, by = 1)
assign(x = ageNames[10], value = rowSums(sex_age_EW[,self1]))
con_sex_age_1[10] <- rowSums(sex_age_EW[self1])

self2 <- seq(98, 104, by = 1)
assign(x = ageNames[11], value = rowSums(sex_age_EW[,self2]))
con_sex_age_1[11] <- rowSums(sex_age_EW[self2])

self3 <- seq(105, 108, by = 1)
assign(x = ageNames[12], value = rowSums(sex_age_EW[,self3]))
con_sex_age_1[12] <- rowSums(sex_age_EW[self3])

self4 <- seq(109, 117, by = 1)
assign(x = ageNames[13], value = rowSums(sex_age_EW[,self4]))
con_sex_age_1[13] <- rowSums(sex_age_EW[self4])

self5 <- seq(118, 127, by = 1)
assign(x = ageNames[14], value = rowSums(sex_age_EW[,self5]))
con_sex_age_1[14] <- rowSums(sex_age_EW[self5])

self6 <- seq(128, 142, by = 1)
assign(x = ageNames[15], value = rowSums(sex_age_EW[,self6]))
con_sex_age_1[15] <- rowSums(sex_age_EW[self6])

self7 <- seq(143, 157, by = 1)
assign(x = ageNames[16], value = rowSums(sex_age_EW[,self7]))
con_sex_age_1[16] <- rowSums(sex_age_EW[self7])

self8 <- seq(158, 167, by = 1)
assign(x = ageNames[17], value = rowSums(sex_age_EW[,self8]))
con_sex_age_1[17] <- rowSums(sex_age_EW[self8])

self9 <- seq(168, 183, by = 1)
assign(x = ageNames[18], value = rowSums(sex_age_EW[,self9]))
con_sex_age_1[18] <- rowSums(sex_age_EW[self9])

Area_code <- sex_age_EW[,c(1)]
con_sex_age_EW <- data.frame(Area_code, con_sex_age_1)

write.csv(con_sex_age_EW, file = "~/Desktop/Microsimulation/constraints/con_sex_age_EW.csv")

names(con_sex_age_EW)
sex_age_EW_adu <- con_sex_age_EW[,c(1,5:10,14:19)] # select out the adult population for England & Wales
write.csv(sex_age_EW_adu, file = "~/Desktop/Microsimulation/constraints/sex_age_EW_adu.csv")

sex_age_EW_child <- con_sex_age_EW[,c(1,2:4,11:13)] # select out the child population for England & Wales
write.csv(sex_age_EW_child, file = "~/Desktop/Microsimulation/constraints/sex_age_EW_child.csv")

# Format sex/age tables for Scotland
sex_age_S <- read.csv("~/Desktop/Microsimulation/sex_age_S.csv")
sex_age_S_orig <- sex_age_S
names(sex_age_S)

selsm1 <- seq(2, 6, by = 1)
rawNames[selsm1]
assign(x = ageNames[1], value = rowSums(sex_age_S[,selsm1]))

con_sex_age_2 <- data.frame(matrix(nrow = nrow(sex_age_S), ncol = length(ageNames)))
names(con_sex_age_2) <- ageNames
con_sex_age_2[1] <- rowSums(sex_age_S[selsm1])

selsm2 <- seq(7, 13, by = 1)
assign(x = ageNames[2], value = rowSums(sex_age_S[,selsm2]))
con_sex_age_2[2] <- rowSums(sex_age_S[selsm2])

selsm3 <- seq(14, 17, by = 1)
assign(x = ageNames[3], value = rowSums(sex_age_S[,selsm3]))
con_sex_age_2[3] <- rowSums(sex_age_S[selsm3])

selsm4 <- seq(18, 26, by = 1)
assign(x = ageNames[4], value = rowSums(sex_age_S[,selsm4]))
con_sex_age_2[4] <- rowSums(sex_age_S[selsm4])

selsm5 <- seq(27, 36, by = 1)
assign(x = ageNames[5], value = rowSums(sex_age_S[,selsm5]))
con_sex_age_2[5] <- rowSums(sex_age_S[selsm5])

selsm6 <- seq(37, 51, by = 1)
assign(x = ageNames[6], value = rowSums(sex_age_S[,selsm6]))
con_sex_age_2[6] <- rowSums(sex_age_S[selsm6])

selsm7 <- seq(52, 66, by = 1)
assign(x = ageNames[7], value = rowSums(sex_age_S[,selsm7]))
con_sex_age_2[7] <- rowSums(sex_age_S[selsm7])

selsm8 <- seq(67, 76, by = 1)
assign(x = ageNames[8], value = rowSums(sex_age_S[,selsm8]))
con_sex_age_2[8] <- rowSums(sex_age_S[selsm8])

selsm9 <- seq(77, 92, by = 1)
assign(x = ageNames[9], value = rowSums(sex_age_S[,selsm9]))
con_sex_age_2[9] <- rowSums(sex_age_S[selsm9])

selsf1 <- seq(93, 97, by = 1)
assign(x = ageNames[10], value = rowSums(sex_age_S[,selsf1]))
con_sex_age_2[10] <- rowSums(sex_age_S[selsf1])

selsf2 <- seq(98, 104, by = 1)
assign(x = ageNames[11], value = rowSums(sex_age_S[,selsf2]))
con_sex_age_2[11] <- rowSums(sex_age_S[selsf2])

selsf3 <- seq(105, 108, by = 1)
assign(x = ageNames[12], value = rowSums(sex_age_S[,selsf3]))
con_sex_age_2[12] <- rowSums(sex_age_S[selsf3])

selsf4 <- seq(109, 117, by = 1)
assign(x = ageNames[13], value = rowSums(sex_age_S[,selsf4]))
con_sex_age_2[13] <- rowSums(sex_age_S[selsf4])

selsf5 <- seq(118, 127, by = 1)
assign(x = ageNames[14], value = rowSums(sex_age_S[,selsf5]))
con_sex_age_2[14] <- rowSums(sex_age_S[selsf5])

selsf6 <- seq(128, 142, by = 1)
assign(x = ageNames[15], value = rowSums(sex_age_S[,selsf6]))
con_sex_age_2[15] <- rowSums(sex_age_S[selsf6])

selsf7 <- seq(143, 157, by = 1)
assign(x = ageNames[16], value = rowSums(sex_age_S[,selsf7]))
con_sex_age_2[16] <- rowSums(sex_age_S[selsf7])

selsf8 <- seq(158, 167, by = 1)
assign(x = ageNames[17], value = rowSums(sex_age_S[,selsf8]))
con_sex_age_2[17] <- rowSums(sex_age_S[selsf8])

selsf9 <- seq(168, 183, by = 1)
assign(x = ageNames[18], value = rowSums(sex_age_S[,selsf9]))
con_sex_age_2[18] <- rowSums(sex_age_S[selsf9])

Area_code <- sex_age_S[,c(1)]
con_sex_age_S <- data.frame(Area_code, con_sex_age_2)

write.csv(con_sex_age_S, file = "~/Desktop/Microsimulation/constraints/con_sex_age_S.csv")

names(con_sex_age_S)
sex_age_S_adu <- con_sex_age_S[,c(1,5:10,14:19)] # select out the adult population for Scotland
write.csv(sex_age_S_adu, file = "~/Desktop/Microsimulation/constraints/sex_age_S_adu.csv")

sex_age_S_child <- con_sex_age_S[,c(1,2:4,11:13)] # select out the child population for Scotland
write.csv(sex_age_S_child, file = "~/Desktop/Microsimulation/constraints/sex_age_S_child.csv")

# Generate the full sex/age table for Great Britain (GB)
sex_age_GB_adu <- rbind(sex_age_EW_adu, sex_age_S_adu) # generate the sex/age table for the GB's adult population
sex_age_GB_child <- rbind(sex_age_EW_child, sex_age_S_child) # generate the sex/age table for the GB's child population

# Generate the full sex/age table for the four selected cities (baseline population)
Four_cities_LSOA <- read.csv("~/Desktop/Microsimulation/Four_cities_LSOA.csv")
sex_age_adu <- merge(Four_cities_LSOA, sex_age_GB_adu, by="Area_code")
sex_age_adu <- sex_age_adu[c(-2)] # generate the sex/age table for the four cities' adult population
sex_age_child <- merge(Four_cities_LSOA, sex_age_GB_child, by="Area_code")
sex_age_child <- sex_age_child[c(-2)] # generate the sex/age table for the four cities' child population
write.csv(sex_age_adu, file = "~/Desktop/Microsimulation/constraints/sex_age_adu.csv")
write.csv(sex_age_child, file = "~/Desktop/Microsimulation/constraints/sex_age_child.csv")

## Format economic status constraint tables
# England and Wales
Employment_EW_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Employment_EW_LSOA.csv")
Employment_EW_LSOA$in_paid_employment <- rowSums(Employment_EW_LSOA[,2:3])
names(Employment_EW_LSOA)[4] <- "self_employed"
Employment_EW_LSOA$unemployed <- rowSums(Employment_EW_LSOA[,c(5,12:15)])
Employment_EW_LSOA$student <- rowSums(Employment_EW_LSOA[,c(6,8)])
names(Employment_EW_LSOA)[7] <- "retired"
names(Employment_EW_LSOA)[9] <- "looking_after_home"
names(Employment_EW_LSOA)[10] <- "long_term_sick/disabled"
names(Employment_EW_LSOA)[11] <- "others"
ecostatus_EW <- Employment_EW_LSOA[,c(1,16,4,17,18,7,9,10,11)]

# Scotland
Employment_S_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Employment_S_LSOA.csv")
Employment_S_LSOA$in_paid_employment <- rowSums(Employment_S_LSOA[,2:3])
names(Employment_S_LSOA)[4] <- "self_employed"
Employment_S_LSOA$unemployed <- rowSums(Employment_S_LSOA[,c(5,12:15)])
Employment_S_LSOA$student <- rowSums(Employment_S_LSOA[,c(6,8)])
names(Employment_S_LSOA)[7] <- "retired"
names(Employment_S_LSOA)[9] <- "looking_after_home"
names(Employment_S_LSOA)[10] <- "long_term_sick/disabled"
names(Employment_S_LSOA)[11] <- "others"
ecostatus_S <- Employment_S_LSOA[,c(1,16,4,17,18,7,9,10,11)]

# The selected four cities
ecostatus_GB <- rbind(ecostatus_EW, ecostatus_S)
ecostatus <- merge(Four_cities_LSOA, ecostatus_GB, by="Area_code")
ecostatus <- ecostatus[c(-2)]
write.csv(ecostatus, file = "~/Desktop/Microsimulation/constraints/ecostatus.csv")

## Format highest qualification constraint tables
# England and Wales
Qualification_EW_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Qualification_EW_LSOA.csv")
names(Qualification_EW_LSOA)[2] <- "None"
Qualification_EW_LSOA$Level_2_1 <- rowSums(Qualification_EW_LSOA[,c(3:4)])
names(Qualification_EW_LSOA)[9] <- "Level_2/1"
names(Qualification_EW_LSOA)[8] <- "others"
Qualification_EW_LSOA$Others <- rowSums(Qualification_EW_LSOA[,c(5,8)])
names(Qualification_EW_LSOA)[7] <- "Level_4/above"
hiqualif_EW <- Qualification_EW_LSOA[,c(1,2,9,6,7,10)]

# Scotland
Qualification_S_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Qualification_S_LSOA.csv")
names(Qualification_S_LSOA)
names(Qualification_S_LSOA)[2] <- "None"
Qualification_S_LSOA$Level_2_1 <- rowSums(Qualification_S_LSOA[,c(3:4)])
names(Qualification_S_LSOA)[9] <- "Level_2/1"
Qualification_S_LSOA$Others <- rowSums(Qualification_S_LSOA[,c(5,8)])
names(Qualification_S_LSOA)[7] <- "Level_4/above"
hiqualif_S <- Qualification_S_LSOA[,c(1,2,9,6,7,10)]

# The selected four cities
hiqualif_GB <- rbind(hiqualif_EW, hiqualif_S)
hiqualif <- merge(Four_cities_LSOA, hiqualif_GB, by="Area_code")
hiqualif <- hiqualif[c(-2)]
write.csv(hiqualif, file = "~/Desktop/Microsimulation/constraints/hiqualif.csv")

## Format marital status constraint tables
# England and Wales
Marital_EW_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Marital_EW_LSOA.csv")
names(Marital_EW_LSOA)[2] <- "single"
names(Marital_EW_LSOA)[3] <- "married"
names(Marital_EW_LSOA)[4] <- "civil_partner"
names(Marital_EW_LSOA)[5] <- "separated"
names(Marital_EW_LSOA)[6] <- "divorced"
names(Marital_EW_LSOA)[7] <- "widowed/surviving"
marstat_EW <- Marital_EW_LSOA

# Scotland
Marital_S_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Marital_S_LSOA.csv")
names(Marital_S_LSOA)[2] <- "single"
names(Marital_S_LSOA)[3] <- "married"
names(Marital_S_LSOA)[4] <- "civil_partner"
names(Marital_S_LSOA)[5] <- "separated"
names(Marital_S_LSOA)[6] <- "divorced"
names(Marital_S_LSOA)[7] <- "widowed/surviving"
marstat_S <- Marital_S_LSOA

# The selected four cities
marstat_GB <- rbind(marstat_EW, marstat_S)
marstat <- merge(Four_cities_LSOA, marstat_GB, by="Area_code")
marstat <- marstat[c(-2)]
write.csv(marstat, file = "~/Desktop/Microsimulation/constraints/marstat.csv")

## Format ethnic group constraint tables
# England and Wales
Ethnicity_EW_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Ethnicity_EW_LSOA.csv")
names(Ethnicity_EW_LSOA)[2] <- "white"
Ethnicity_EW_LSOA$White <- rowSums(Ethnicity_EW_LSOA[,c(2:3)])
Ethnicity_EW_LSOA$Asian <- rowSums(Ethnicity_EW_LSOA[,c(5:9)])
ethnicity_EW <- Ethnicity_EW_LSOA[,c(1,12,4,13,10,11)]

# Scotland
Ethnicity_S_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Ethnicity_S_LSOA.csv")
Ethnicity_S_LSOA$White <- rowSums(Ethnicity_S_LSOA[,c(2:3)])
Ethnicity_S_LSOA$Asian <- rowSums(Ethnicity_S_LSOA[,c(5:9)])
ethnicity_S <- Ethnicity_S_LSOA[,c(1,12,4,13,10,11)]

# The selected four cities
ethnicity_GB <- rbind(ethnicity_EW, ethnicity_S)
ethnicity <- merge(Four_cities_LSOA, ethnicity_GB, by="Area_code")
ethnicity <- ethnicity[c(-2)]
write.csv(ethnicity, file = "~/Desktop/Microsimulation/constraints/ethnicity.csv")

## Format type of household composition constraint tables 
# England and Wales
Household_Com_EW_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Household_Com_EW_LSOA.csv")
names(Household_Com_EW_LSOA)[2] <- "1_adu_no_child"
names(Household_Com_EW_LSOA)[13] <- "1_adu_child"
Household_Com_EW_LSOA$"1_couple_no_child" <- rowSums(Household_Com_EW_LSOA[,c(3,4,8,9)])
Household_Com_EW_LSOA$"1_couple_child" <- rowSums(Household_Com_EW_LSOA[,c(5,6,7,10,11,12)])
Household_Com_EW_LSOA$"others_no_child" <- rowSums(Household_Com_EW_LSOA[,c(16:18)])
Household_Com_EW_LSOA$"others_child" <- rowSums(Household_Com_EW_LSOA[,c(14,15)])
hhtype_EW <- Household_Com_EW_LSOA[,c(1,2,13,19,20,21,22)]

# Scotland 
Household_Com_S_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Household_Com_S_LSOA.csv")
names(Household_Com_S_LSOA)[2] <- "1_adu_no_child"
names(Household_Com_S_LSOA)[13] <- "1_adu_child"
Household_Com_S_LSOA$"1_couple_no_child" <- rowSums(Household_Com_S_LSOA[,c(3,4,8,9)])
Household_Com_S_LSOA$"1_couple_child" <- rowSums(Household_Com_S_LSOA[,c(5,6,7,10,11,12)])
Household_Com_S_LSOA$"others_no_child" <- rowSums(Household_Com_S_LSOA[,c(16:18)])
Household_Com_S_LSOA$"others_child" <- rowSums(Household_Com_S_LSOA[,c(14,15)])
hhtype_S <- Household_Com_S_LSOA[,c(1,2,13,19:22)]

# The selected four cities
hhtype_GB <- rbind(hhtype_EW, hhtype_S)
hhtype <- merge(Four_cities_LSOA, hhtype_GB, by="Area_code")
hhtype <- hhtype[c(-2)]
write.csv(hhtype, file = "~/Desktop/Microsimulation/constraints/hhtype.csv")

## Format household tenure constraint tables
# England and Wales
Tenure_EW_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Tenure_EW_LSOA.csv")
names(Tenure_EW_LSOA)[2] <- "owned_outright"
names(Tenure_EW_LSOA)[3] <- "owned_mortgage"
names(Tenure_EW_LSOA)[5] <- "social_rented"
names(Tenure_EW_LSOA)[6] <- "private_rented"
Tenure_EW_LSOA$others <- rowSums(Tenure_EW_LSOA[,c(4,7)])
Tenure_EW <- Tenure_EW_LSOA[,c(1,2,3,5,6,8)]

# Scotland
Tenure_S_LSOA <- read.csv("~/Desktop/Microsimulation/Cesus LSOA/Tenure_S_LSOA.csv")
names(Tenure_S_LSOA)[2] <- "owned_outright"
names(Tenure_S_LSOA)[3] <- "owned_mortgage"
names(Tenure_S_LSOA)[5] <- "social_rented"
names(Tenure_S_LSOA)[6] <- "private_rented"
Tenure_S_LSOA$others <- rowSums(Tenure_S_LSOA[,c(4,7)])
Tenure_S <- Tenure_S_LSOA[,c(1,2,3,5,6,8)]

# The selected four cities
Tenure_GB <- rbind(Tenure_EW, Tenure_S)
Tenure <- merge(Four_cities_LSOA, Tenure_GB, by="Area_code")
Tenure <- Tenure[c(-2)]
write.csv(Tenure, file = "~/Desktop/Microsimulation/constraints/Tenure.csv")

## Scale other constraints to the baseline population for adults set by sex/age constraint
sum(sex_age_adu)
sum(ecostatus) 
sum(hiqualif) 
sum(marstat)
sum(ethnicity)
sum(hhtype)
sum(Tenure)
c(sum(sex_age_S_adu), sum(ecostatus), sum(hiqualif), sum(marstat), sum(ethnicity), 
  sum(hhtype), sum(Tenure)) / sum(sex_age_adu) # examine how much the values deviate from the baseline population

con.pop <- rowSums(sex_age_adu)
sex_age_adu <- round(sex_age_adu * con.pop / rowSums(sex_age_adu))
ecostatus <- round(ecostatus * con.pop / rowSums(ecostatus))
hiqualif <- round(hiqualif * con.pop / rowSums(hiqualif))
marstat <- round(marstat * con.pop / rowSums(marstat))
ethnicity <- round(ethnicity * con.pop / rowSums(ethnicity))
hhtype <- round(hhtype * con.pop / rowSums(hhtype))
Tenure <- round(Tenure * con.pop / rowSums(Tenure))
sum(sex_age_adu)
sum(ecostatus) 
sum(hiqualif) 
sum(marstat)
sum(ethnicity)
sum(hhtype)
sum(Tenure) # ensure that the total population count for each constraint is equal

## The processes of spatial microsimulation are enabled in the Flexible Modellin Framework (FMF) and result in the 
## synthetic population dataset for adults ("ADULT_population.csv") and for children ("CHILD_population.csv").

## Generating synthetic adult microdata with rich individual and household attributes
Population_ind <- merge(ADULT_population, raw_ind_full, by="pidp")

## Aggregating subjective wellbing Likert score by LSOA code, asking for mean for each LSOA
SW_L_agg <- aggregate(Population_ind$sub_wellb_L, by = list(Population_ind$LSOA_code), mean)
names(SW_L_agg) <- c("LSOA_code", "Subjective_wellbing_Likert_score")

## Aggregating subjective wellbing Caseness score by LSOA code, asking for mean for each LSOA
SW_C_agg <- aggregate(Population_ind$sub_wellb_C, by = list(Population_ind$LSOA_code), mean)
names(SW_C_agg) <- c("LSOA_code", "Subjective_wellbing_Caseness_score")

## Aggregating physical component summary (PCS) score by LSOA code, asking for mean for each LSOA
PCS_agg <- aggregate(Population_ind$phy_comp_sum, by = list(Population_ind$LSOA_code), mean)
names(PCS_agg) <- c("LSOA_code", "Physical_Component_Summary")

## Aggregating mental component summary (MCS) score by LSOA code, asking for mean for each LSOA
MCS_agg<- aggregate(Population_ind$men_comp_sum, by = list(Population_ind$LSOA_code), mean)
names(MCS_agg) <- c("LSOA_code", "Mental_Component_Summary")

## Aggregating monthly household net income by LSOA code, asking for mean for each LSOA
HouseIncome_agg <- aggregate(Population_ind$house_income_mon, by = list(Population_ind$LSOA_code), mean)
names(HouseIncome_agg) <- c("LSOA_code", "Household_net_income_monthly")

## Merging aggregations into one aggregated dataset
agg_LSOA <- Reduce(function(x,y) merge(x = x, y = y, by = "LSOA_code"), list(SW_L_agg, SW_C_agg, PCS_agg, 
            MCS_agg, HouseIncome_agg))

