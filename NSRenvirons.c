//estimating frequency of 2sg and 2pl and other sbj environments for NSR vs Zero vs StE grammar study with Lisa
nodes_only:t
remove_nodes:t
add_to_ignore: \**
define:../../OldNorse/verbtopic.def
node: IP*
coding_query:


1: {
 thou: (IP* idoms finite_verb) AND (IP* idoms NP-NOM*|NP-SBJ*) AND (NP-NOM*|NP-SBJ* idomsonly PRO*) AND (PRO* idoms +[tT][ouOU]*|[tT][hH][ouOU]*)
      
    you: (IP* idoms finite_verb) AND (IP* idoms NP-NOM*|NP-SBJ*) AND (NP-NOM*|NP-SBJ* idomsonly PRO*) AND (PRO* idoms +[gG][ouOUeE]*|[gGzZyY][ouOUeE]*)

    othersbj: (IP* idoms finite_verb) AND (IP* idoms NP-NOM*|NP-SBJ*)
	z: ELSE
}




//verb is modal or not

2:{

    modal: (IP* idoms MD)

    otherfinite: (IP* idoms finite_verb)

    z: ELSE
  
}

//adjacent or not

3: {
 ad: (IP* idoms finite_verb) AND (IP* idoms NP-NOM*|NP-SBJ*) AND (NP-NOM*|NP-SBJ* iprecedes finite_verb)

    follows: (IP* idoms finite_verb) AND (IP* idoms NP-NOM*|NP-SBJ*) AND (finite_verb precedes NP-NOM*|NP-SBJ*)
    nonad: (IP* idoms finite_verb) AND (IP* idoms NP-NOM*|NP-SBJ*) AND (NP-NOM*|NP-SBJ* iprecedes !finite_verb) AND (NP-NOM*|NP-SBJ* precedes finite_verb)
    z: ELSE
    }

4: {
 agr: (IP* idoms finite_verb) AND (finite_verb idoms *t|*te)

 nonagr: (IP* idoms finite_verb) AND (finite_verb idoms !*t|*te)

    z: ELSE
    }
