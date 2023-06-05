% Facts: Diseases and Symptoms

/*
 * has_disease(Name, Category) if Symptoms
 *      Rules associating a disease with a list of symptoms
 */

% Infectious Diseases

has_disease(measles, infectious) if
    know(has(fever)) and
    know(has(rash)) and
    know(has(cough)) and
    know(has(runny_nose)) and
    know(has(red_eyes)).

has_disease(german_measles, infectious) if
    know(has(rash)) and
    know(has(fever)) and
    know(has(headache)) and
    know(has(runny_nose)).

has_disease(flu, infectious) if
    know(has(fever)) and
    know(has(cough)) and
    know(has(sore_throat)) and
    know(has(muscle_aches)) and
    know(has(fatigue)).

has_disease(common_cold, infectious) if
    know(has(runny_nose)) and
    know(has(sneezing)) and
    know(has(sore_throat)) and
    know(has(cough)).

has_disease(mumps, infectious) if
    know(has(swollen_salivary_glands)) and
    know(has(fever)) and
    know(has(headache)) and
    know(has(muscle_aches)).

has_disease(chicken_pox, infectious) if
    know(has(itchy_rash)) and
    know(has(fever)) and
    know(has(fatigue)).

has_disease(hepatitis_c, infectious) if
    know(has(fatigue)) and
    know(has(jaundice)) and
    know(has(abdominal_pain)) and
    know(has(loss_of_appetite)).

has_disease(pneumocystis_carinii_pneumonia, infectious) if
    know(has(shortness_of_breath)) and
    know(has(dry_cough)) and
    know(has(fever)) and
    know(has(fatigue)).

has_disease(pneumonia_aspiration, infectious) if
    know(has(cough)) and
    know(has(chest_pain)) and
    know(has(fever)) and
    know(has(difficulty_breathing)).

has_disease(systemic_infection, infectious) if
    know(has(fever)) and
    know(has(chills)) and
    know(has(fatigue)) and
    know(has(body_aches)) and
    know(has(confusion)).

has_disease(infection_urinary_tract, infectious) if
    know(has(frequent_urination)) and
    know(has(pain_burning_urination)) and
    know(has(cloudy_urine)) and
    know(has(abdominal_pain)).

has_disease(candidiasis, infectious) if
    know(has(oral_thrush)) and
    know(has(genital_yeast_infection)) and
    know(has(skin_rash)) and
    know(has(fatigue)).

has_disease(sepsis_invertebrate, infectious) if
    know(has(fever)) and
    know(has(rapid_breathing)) and
    know(has(rapid_heart_rate)) and
    know(has(confusion)).



% Sexually Transmitted Infections (STIs)

has_disease(hiv, sti) if
    know(has(fatigue)) and
    know(has(fever)) and
    know(has(swollen_lymph_nodes)) and
    know(has(weight_loss)) and
    know(has(opportunistic_infections)).

has_disease(aids, sti) if
    know(has(persistent_fever)) and
    know(has(chronic_diarrhea)) and
    know(has(night_sweats)) and
    know(has(opportunistic_infections)).

% Mental Health Disorders
has_disease(depressionmental, mental) if
    know(has(persistent_sadness)) and
    know(has(loss_of_interest)) and
    know(has(changes_appetite_sleep_patterns)) and
    know(has(fatigue)).

has_disease(bipolardisorder, mental) if
    know(has(mood_swings)) and
    know(has(changes_energy_levels)) and
    know(has(sleep_disturbances)) and
    know(has(impulsivity)).

has_disease(schizophrenia, mental) if
    know(has(delusions)) and
    know(has(hallucinations)) and
    know(has(disorganized_thinking)) and
    know(has(social_withdrawal)).

has_disease(psychoticdisorder, mental) if
    know(has(hallucinations)) and
    know(has(delusions)) and
    know(has(disorganized_behavior)).

has_disease(paranoia, mental) if
    know(has(irrational_distrust_suspicion)) and
    know(has(feelings_persecution)).

has_disease(delirium, mental) if
    know(has(confusion)) and
    know(has(disorientation)) and
    know(has(changes_consciousness)) and
    know(has(hallucinations)).

has_disease(delusion, mental) if
    know(has(fixed_false_belief_not_based_reality)).

% Blood Disorders

has_disease(anemia, blood) if
    know(has(fatigue)) and
    know(has(weakness)) and
    know(has(pale_skin)) and
    know(has(shortness_of_breath)).

has_disease(sicklecellanemia, blood) if
    know(has(fatigue)) and
    know(has(pain_crisis)) and
    know(has(jaundice)) and
    know(has(shortness_of_breath)).

has_disease(pancytopenia, blood) if
    know(has(easy_bruising)) and
    know(has(frequent_infections)) and
    know(has(fatigue)) and
    know(has(shortness_of_breath)).

has_disease(thrombocytopaenia, blood) if
    know(has(easy_bruising)) and
    know(has(prolonged_bleeding)) and
    know(has(petechiae)).

% Cancer and Tumors

has_disease(neoplasmmetastasis, tumors) if
    know(has(thicken)) and
    know(has(tumorcellinvasion)) and
    know(has(metastaticlesion)) and
    know(has(painneck)) and
    know(has(lungnodule)) and
    know(has(pain)) and
    know(has(painabdominal)) and
    know(has(foodintolerance)) and
    know(has(massofbodystructure)) and
    know(has(atypia)).


has_disease(malignantneoplasmofprostate, tumors) if
    know(has(hematuria)) and
    know(has(dysesthesia)) and
    know(has(asthenia)) and
    know(has(polymyalgia)) and
    know(has(passedstones)) and
    know(has(pleuriticpain)) and
    know(has(guaiacpositive)) and
    know(has(rale)) and
    know(has(breathsoundsdecreased)) and
    know(has(urgeincontinence)) and
    know(has(dysuria)) and
    know(has(diarrhea)) and
    know(has(vertigo)) and
    know(has(qtintervalprolonged)) and
    know(has(ataxia)) and
    know(has(paresis)) and
    know(has(hemianopsiahomonymous)) and
    know(has(tumorcellinvasion)) and
    know(has(hemodynamicallystable)) and
    know(has(massofbodystructure)) and
    know(has(rhonchus)) and
    know(has(orthostasis)) and
    know(has(decreasedbodyweight)).

has_disease(malignantneoplasms, tumors) if
    know(has(pain)) and
    know(has(massofbodystructure)) and
    know(has(lesion)) and
    know(has(cushingoidfacies)) and
    know(has(cushingoidhabitus)) and
    know(has(emphysematouschange)) and
    know(has(decreasedbodyweight)) and
    know(has(ascites)) and
    know(has(hoarseness)) and
    know(has(thicken)).


% Endocrine Disorders

has_disease(hypothyroidism, endocrine) if
    know(has(fatigue)) and
    know(has(weight_gain)) and
    know(has(cold_intolerance)) and
    know(has(depression)).

has_disease(hyperglycemia, endocrine) if
    know(has(increased_thirst)) and
    know(has(frequent_urination)) and
    know(has(blurred_vision)) and
    know(has(fatigue)).

% Digestive System Disorders

has_disease(cholelithiasis, digestive) if
    know(has(abdominal_pain)) and
    know(has(nausea)) and
    know(has(vomiting)) and
    know(has(jaundice)).

has_disease(cirrhosis, digestive) if
    know(has(fatigue)) and
    know(has(jaundice)) and
    know(has(abdominal_swelling)) and
    know(has(confusion)).

has_disease(pancreatitis, digestive) if
    know(has(abdominal_pain)) and
    know(has(nausea)) and
    know(has(vomiting)) and
    know(has(fever)).

has_disease(ulcer_peptic, digestive) if
    know(has(abdominal_pain)) and
    know(has(bloating)) and
    know(has(heartburn)) and
    know(has(nausea)).

has_disease(diverticulosis, digestive) if
    know(has(abdominal_pain)) and
    know(has(bloating)) and
    know(has(changes_bowel_habits)) and
    know(has(rectal_bleeding)).

has_disease(colitis, digestive) if
    know(has(abdominal_pain)) and
    know(has(diarrhea)) and
    know(has(rectal_bleeding)) and
    know(has(weight_loss)).

has_disease(gastritis, digestive) if
    know(has(abdominal_pain)) and
    know(has(nausea)) and
    know(has(vomiting)) and
    know(has(bloating)).

has_disease(hemorrhoids, digestive) if
    know(has(rectal_pain)) and
    know(has(itching)) and
    know(has(bleeding)) and
    know(has(discomfort)).

% Cardiovascular Diseases

has_disease(coronaryarteriosclerosis, cardiovascular) if
    know(has(chest_pain)) and
    know(has(shortness_of_breath)) and
    know(has(fatigue)).

has_disease(hypertensivedisease, cardiovascular) if
    know(has(high_blood_pressure)) and
    know(has(headaches)) and
    know(has(dizziness)) and
    know(has(chest_pain)).

has_disease(hypertensionpulmonary, cardiovascular) if
    know(has(shortness_of_breath)) and
    know(has(fatigue)) and
    know(has(chest_pain)) and
    know(has(dizziness)).

has_disease(coronaryheartdisease, cardiovascular) if
    know(has(chest_pain)) and
    know(has(shortness_of_breath)) and
    know(has(fatigue)).

has_disease(thrombus, cardiovascular) if
    know(has(pain)) and
    know(has(swelling)) and
    know(has(redness)) and
    know(has(warmth_in_affected_area)).

has_disease(tricuspidvalveinsufficiency, cardiovascular) if
    know(has(fatigue)) and
    know(has(shortness_of_breath)) and
    know(has(swelling_legs_feet)).

has_disease(mitralvalveinsufficiency, cardiovascular) if
    know(has(fatigue)) and
    know(has(shortness_of_breath)) and
    know(has(irregular_heartbeat)).

has_disease(failureheart, cardiovascular) if
    know(has(shortness_of_breath)) and
    know(has(fatigue)) and
    know(has(swollen_ankles_legs)) and
    know(has(rapid_heartbeat)).

% Neurological Disorders

has_disease(epilepsy, neurological) if
    know(has(seizures)) and
    know(has(loss_of_consciousness)) and
    know(has(confusion)) and
    know(has(jerking_movements)).

has_disease(migrainedisorders, neurological) if
    know(has(intense_headaches)) and
    know(has(sensitivity_light_sound)) and
    know(has(nausea)) and
    know(has(visual_disturbances)).

has_disease(neuropathy, neurological) if
    know(has(numbness_tingling_extremities)) and
    know(has(muscle_weakness)) and
    know(has(pain)) and
    know(has(sensitivity_touch)).

% Respiratory Disorders

has_disease(pneumothorax, resipiratory) if
    know(has(sudden_sharp_chest_pain)) and
    know(has(difficulty_breathing)) and
    know(has(rapid_breathing)).

has_disease(bronchitis, resipiratory) if
    know(has(cough)) and
    know(has(mucus_production)) and
    know(has(chest_discomfort)) and
    know(has(shortness_of_breath)).

has_disease(respiratoryfailure, resipiratory) if
    know(has(difficulty_breathing)) and
    know(has(shortness_of_breath)) and
    know(has(fatigue)) and
    know(has(confusion)).

% Renal Disorders

has_disease(insufficiency_renal, renal) if
    know(has(fatigue)) and
    know(has(decreased_urine_output)) and
    know(has(swelling_legs_ankles)) and
    know(has(nausea)).

has_disease(failurekidney, renal) if
    know(has(fatigue)) and
    know(has(decreased_urine_output)) and
    know(has(swelling_legs_ankles)) and
    know(has(nausea)).

has_disease(kidneyfailureacute, renal) if
    know(has(fatigue)) and
    know(has(decreased_urine_output)) and
    know(has(swelling_legs_ankles)) and
    know(has(nausea)).

% Metabolic Disorders

has_disease(hypoglycemia, metabolic) if
    know(has(shakiness)) and
    know(has(dizziness)) and
    know(has(sweating)) and
    know(has(confusion)) and
    know(has(hunger)).

has_disease(hypercholesterolemia, metabolic) if
    know(has(no_specific_symptoms)).

has_disease(obesitymorbid, metabolic) if
    know(has(excessive_body_weight)) and
    know(has(difficulty_physical_movement)) and
    know(has(fatigue)).

has_disease(osteoporosis, metabolic) if
    know(has(fragile_bones)) and
    know(has(increased_fracture_risk)) and
    know(has(back_pain)) and
    know(has(loss_of_height)).

% Autoimmune Disorders

has_disease(arthritis, autoimmune) if
    know(has(joint_pain)) and
    know(has(joint_stiffness)) and
    know(has(joint_swelling)) and
    know(has(limited_range_of_motion)).

has_disease(degenerativepolyarthritis, autoimmune) if
    know(has(joint_pain)) and
    know(has(joint_stiffness)) and
    know(has(joint_swelling)) and
    know(has(limited_range_of_motion)).

% Other Disorders

has_disease(confusion, other) if
    know(has(disorientation)) and
    know(has(difficulty_focusing)) and
    know(has(memory_problems)) and
    know(has(behavior_changes)).

has_disease(overloadfluid, other) if
    know(has(swelling_legs_ankles)) and
    know(has(shortness_of_breath)) and
    know(has(weight_gain)).

has_disease(hemiparesis, other) if
    know(has(weakness_or_paralysis_one_side_of_body)) and
    know(has(difficulty_speaking)).

has_disease(gout, other) if
    know(has(severe_joint_pain)) and
    know(has(joint_swelling)) and
    know(has(redness)) and
    know(has(limited_range_of_motion)).

has_disease(incontinence, other) if
    know(has(involuntary_loss_of_bladder_bowel_control)).

has_disease(ileus, other) if
    know(has(abdominal_pain)) and
    know(has(bloating)) and
    know(has(vomiting)) and
    know(has(lack_of_passing_stool_gas)).

has_disease(obstructivejaundice, other) if
    know(has(yellowing_skin_eyes)) and
    know(has(dark_urine)) and
    know(has(pale_stools)) and
    know(has(abdominal_pain)).


