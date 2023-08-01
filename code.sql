/* Select the hacker id and name from hackers table and make hack to hackers table alias*/
select hack.hacker_id,hack.name from hackers hack
/* Join the submissions table as sub and be sure about hacker_id columns are equal */
inner join submissions sub on hack.hacker_id = sub.hacker_id
/* Join the challenges table as sub and be sure about challenges table and submission tables challenge_id columns are equal and do the same for difficulty table*/
inner join challenges cha on cha.challenge_id = sub.challenge_id
inner join difficulty dif on dif.difficulty_level = cha.difficulty_level
/* we bound the relations so far, and now make equal to the columns in the below because in the next line of the code we grouped them to count to know how many exercises they made*/
where sub.score = dif.score and cha.difficulty_level = dif.difficulty_level
group by hack.hacker_id, hack.name
/*Now we say who has need to make exercises more than 1 */
having count(sub.hacker_id) > 1
/* and order them to find which one is the best*/
order by count(sub.hacker_id) desc, sub.hacker_id asc;