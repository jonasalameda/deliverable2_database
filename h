[33mcommit 5b1cbefbedc456f6669de25e06d0335352b664da[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmain[m[33m)[m
Author: %username% <%email%>
Date:   Sun Oct 27 19:26:14 2024 -0400

    Inserted Values into Toursit Table

[33mcommit bd1babbb274869a6acc30ba52a85c96007f9c021[m
Author: %username% <%email%>
Date:   Sun Oct 27 19:19:42 2024 -0400

    Inserted Values into Guide Table

[33mcommit fbf9dba2664f108234babea6bbe813f2ab3eb646[m
Author: %username% <%email%>
Date:   Sun Oct 27 19:12:23 2024 -0400

    Inserted values for Place Table 'i gotta be honest it is totally random so for sure they do not exist but i think they seem fairly believable' inserted one line for guide and Tourist

[33mcommit e04756b5ddcfe12ed51d99c2c7f46f45bccb83aa[m
Author: %username% <%email%>
Date:   Sun Oct 27 18:52:56 2024 -0400

    changed the order of our sequences to match the order  in which we created tables and insert values

[33mcommit 65a10c8661792519299bbf2dabbb1a17dcda93d4[m[33m ([m[1;31morigin/main[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: %username% <%email%>
Date:   Fri Oct 25 15:44:34 2024 -0400

    2 alter tables for unique constraint, ON DELETE added directly to the table and added non null constraints to table directly as well

[33mcommit 551e061d6413e9fa41b4159c5bec3d0839ff0dce[m
Author: sr-delightfully <%email%>
Date:   Fri Oct 25 14:10:07 2024 -0400

    edited code to better match diagram, as well as fixed some small errors in the syntax.

[33mcommit 214c8c928b5c9fd693c63ceeb1b419338c9161da[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Thu Oct 24 20:37:59 2024 -0400

    remove minor comments

[33mcommit 72e013d8c8de1586e921ff087bbbcde43aa0e5eb[m
Merge: 12618e4 a1ccec9
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Thu Oct 24 20:36:46 2024 -0400

    Merge pull request #2 from jonasalameda/new-diagram
    
    Update from old to new grade

[33mcommit a1ccec9fa4db7f56c5649786fa0e9837cc234e6f[m[33m ([m[1;31morigin/new-diagram[m[33m)[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Thu Oct 24 20:30:16 2024 -0400

    add insert for tables with sequenced ID

[33mcommit f206cd7ead66a11331c7b3b1c09b1bd967379105[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Thu Oct 24 20:25:32 2024 -0400

    update and add sequence

[33mcommit 1b22d19d1cdb23b7924fae56836085d5966a097c[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Thu Oct 24 20:11:48 2024 -0400

    implement TourSite and fix minor mistakes

[33mcommit 070117cccf33b1a9768ddb2230174e71eca114ed[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Thu Oct 24 19:48:44 2024 -0400

    fix and add constraints

[33mcommit 6183a79e2df03af7471f37de0fb2c930153733cd[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Thu Oct 24 19:35:43 2024 -0400

    fix relationships according to new diagram

[33mcommit 70a06920b9974e655a5c73f0b654587beb86b195[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Thu Oct 24 15:17:21 2024 -0400

    fix small mistakes and add implement improved ID

[33mcommit 12618e4742d9de352601020401033700eb3e0966[m
Author: %username% <%email%>
Date:   Wed Oct 23 16:29:24 2024 -0400

    added unique constraint to tour name and trip name as well

[33mcommit 625cd2d73e8cf794ca0e82369c1393f74dd47373[m
Author: %username% <%email%>
Date:   Wed Oct 23 16:26:57 2024 -0400

    removed the too many sequences, added a unique constraint for location and changed datattype on transaction to int

[33mcommit f56b6a7dbf6d12546127a3c4a767e8fd7869452e[m
Author: %username% <%email%>
Date:   Wed Oct 23 16:10:57 2024 -0400

    i modified the name of one constraints as it said FK instead of PK also created a sequence for each table except the address and location, altered the location_ID as an int instead of VARCHAR in order to have identity.

[33mcommit a184fd8041ab17312137cb199bf4a7154bc3d11f[m
Merge: af5fde6 339620e
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Wed Oct 23 09:50:07 2024 -0400

    Merge pull request #1 from jonasalameda/diagram-applied
    
    apply diagram-applied branch

[33mcommit 339620ed2b11b15a0117e72a8e102714b1d3ff10[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Tue Oct 22 21:50:25 2024 -0400

    add 1 to many relation for tour-location

[33mcommit 77d968f6bb54bb62e424291944c60658ec62ec89[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Tue Oct 22 21:46:12 2024 -0400

    tour-guide and trip-guide be a 1 to many relation

[33mcommit 9cdd49bf19253a493f0669c87bc7bb6b47f8f696[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Tue Oct 22 21:25:08 2024 -0400

    add transaction and tourist tables

[33mcommit 67bbd4ef4c648da807567e55f830a3075511b5e6[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Tue Oct 22 21:11:57 2024 -0400

    add Trip table

[33mcommit 6fbd0fe98987061edf78cc049bd965846604502f[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Tue Oct 22 21:06:09 2024 -0400

    add Location table

[33mcommit eb1347ae8e7a376b5e0b47e5f99f20595d8ef641[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Tue Oct 22 21:01:54 2024 -0400

    add foreign keys to previous tables

[33mcommit 6a7a256dff548a29c8f0a80b09ebb4ad280e36a5[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Tue Oct 22 20:22:10 2024 -0400

    add Qualification table

[33mcommit be37c7f86c7a61cc0bb4c0a91cb95bb2a3d03d5b[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Tue Oct 22 20:08:42 2024 -0400

    add table Address

[33mcommit ac6e4e2a0f4ae18d04ceca2cd0b65f7ab16756f9[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Tue Oct 22 20:03:31 2024 -0400

    add Tour table

[33mcommit b17125209c56c0266babb3e005b4de014a078d70[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Mon Oct 21 21:39:33 2024 -0400

    add Guide table
    
    added guide table based on the outdated diagram

[33mcommit af5fde6d2c0d7c174edfd41cb35ea67239a5372d[m
Author: jonas <125613982+jonasalameda@users.noreply.github.com>
Date:   Mon Oct 21 18:58:07 2024 -0400

    Create MontrealScenicTours.sql
