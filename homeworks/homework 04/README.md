# Database Systems Homework 04

> NTUST Course Project  
> Course No: `CS3010301`  
> Course Name: Database Systems  
> Author: Hayden Chang 張皓鈞 B11030202  
> Email: B11030202@mail.ntust.edu.tw



## 1. Exercise 14.24

### Answer

- Given

  | A    | B    | C    | D    | E    | F    | G    | H    | I    | J    |
  | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    |      |      |      |      |      |      |      |
  | ◎    |      |      | ↑    | ↑    |      |      |      |      |      |
  |      | ◎    |      |      |      | ↑    |      |      |      |      |
  |      |      |      |      |      | ◎    | ↑    | ↑    |      |      |
  |      |      |      | ◎    |      |      |      |      | ↑    | ↑    |

- 1NF

  | A    | B    | C    | D    | E    | F    | G    | H    | I    | J    |
  | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    | ↑    | ↑    | ↑    | ↑    | ↑    | ↑    | ↑    |
  | ◎    |      |      | ↑    | ↑    |      |      |      | ↑    | ↑    |
  |      | ◎    |      |      |      | ↑    | ↑    | ↑    |      |      |
  |      |      |      |      |      | ◎    | ↑    | ↑    |      |      |
  |      |      |      | ◎    |      |      |      |      | ↑    | ↑    |

​	Key for `R` is `{A, B}`

- 2NF

  | A    | B    | C    |      | A    | D    | E    | I    | J    |      | B    | F    | G    | H    |
  | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    |      | ◎    | ↑    | ↑    | ↑    | ↑    |      | ◎    | ↑    | ↑    | ↑    |
  |      |      |      |      |      | ◎    |      | ↑    | ↑    |      |      | ◎    | ↑    | ↑    |

- 3NF

  | A    | B    | C    |      | A    | D    | E    |      | B    | F    |      | F    | G    | H    |      | D    | I    | J    |
  | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    |      | ◎    | ◎    | ◎    |      | ◎    | ↑    |      | ◎    | ↑    | ↑    |      | ◎    | ↑    | ↑    |



## 2. Exercise 14.27

### Answer

- Given

  | A    | B    | C    | D    | E    |
  | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    |      |      |
  |      |      | ◎    | ◎    | ↑    |
  |      | ↑    |      | ◎    | ◎    |

  `{A, B}` is not a candidate key because it need `{C, D}` to relate to `E`

  `{A, B, D}` is a candidate key.



## 3. Exercise 14.30

### Answer

- Given (in 1NF)

  | Car# | Date_sold | Salesperson# | Commission% | Discount_amt |
  | ---- | --------- | ------------ | ----------- | ------------ |
  | ◎    | ↑         | ◎            | ( ↑ )       | ( ↑ )        |
  |      | ◎         |              |             | ↑            |
  |      |           | ◎            | ↑           |              |

  It's in 1NF because FD3 use partial key as it's key.

- 2NF

  | Car# | Date_sold | Salesperson# | Discount_amt |      | Salesperson# | Commission% |
  | ---- | --------- | ------------ | ------------ | ---- | ------------ | ----------- |
  | ◎    | ↑         | ◎            | ↑            |      | ◎            | ↑           |
  |      | ◎         |              | ↑            |      |              |             |

- 3NF

  | Car# | Date_sold | Salesperson# |      | Salesperson# | Commission% |      | Date_sold | Discount_amt |
  | ---- | --------- | ------------ | ---- | ------------ | ----------- | ---- | --------- | ------------ |
  | ◎    | ↑         | ◎            |      | ◎            | ↑           |      | ◎         | ↑            |



## 4. 

Suppose you are given a relation *R* with four attributes *ABCD*. For each of the following sets of FDs, assuming those are the only dependencies that hold for *R*, do the following: (a) Identify the candidate key(s) for *R*. (b) Identify the best normal form that *R* satisfies (1NF, 2NF, 3NF, or BCNF). (c) If *R* is not in BCNF, decompose it into a set of BCNF relations that preserve the dependencies.

- **a.** C → D, C → A, B → C
- **b.** *AB → C, AB → D, C → A, D → B*

### Answer

- **a.**

  - Given (2NF)

    | A     | B    | C    | D     |
    | ----- | ---- | ---- | ----- |
    | ↑     |      | ◎    | ↑     |
    | ( ↑ ) | ◎    | ↑    | ( ↑ ) |

    - (a) Candidate key is `{B}`

    - (b) Best normal form is 2NF

    - (c) BCNF

      | B    | C    |      | C    | A    | D    |
      | ---- | ---- | ---- | ---- | ---- | ---- |
      | ◎    | ↑    |      | ◎    | ↑    | ↑    |

- **b.**

  - Given (3NF)

    | A    | B    | C    | D    |
    | ---- | ---- | ---- | ---- |
    | ◎    | ◎    | ↑    | ↑    |
    | ↑    |      | ◎    |      |
    |      | ↑    |      | ◎    |

    - (a) Candidate key is `{A, B}`, `{C, D}`, `{A, D}`, `{B, C}`

    - (b) Best normal form is 3NF

    - (c) BCNF

      | A    | C    |      | B    | C    |      | A    | D    |      | B    | D    |
      | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
      | ↑    | ◎    |      | ◎    | ◯    |      | ◎    | ◯    |      | ↑    | ◎    |



## 5. Exercise 22.27

### Answer

**No-Steal:** Uncommitted data will not exist on disk, so there is no need to record redo or undo logs.

**Force:** After a commit, all updates must be written to disk. Uncommitted data is not guaranteed. Due to the no-steal/force policy, data on disk is guaranteed to be committed data. Therefore, redo and undo operations are not necessary during checkpointing and recovery, making them faster.



## 6.

Consider the following SQL query:

```sql
SELECT P.Pname, E.Fname, E.Lname
FROM EMPLOYEE E, PROJECT P, WORK_ON W
WHERE W.Hours < 40 AND E.Ssn = W.Essn AND W.Pno = P.Pnumber AND E.Sex = ‘F’;
```

- **a.** Draw the query graph.
- **b.** Draw the initial query tree.
- **c.** Draw the optimized query tree using heuristic optimization.

### Answer

- **a.**

  ![6_a.drawio](assets/6_a.drawio.svg)

- **b.**

  ![6_b.drawio](assets/6_b.drawio.svg)

- **c.**

  ![6_c.drawio](assets/6_c.drawio.svg)
