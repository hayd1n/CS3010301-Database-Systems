# Database Systems Homework 04

> NTUST Course Project  
> Course No: `CS3010301`  
> Course Name: Database Systems  
> Author: Hayden Chang 張皓鈞 B11030202  
> Email: B11030202@mail.ntust.edu.tw



## 1. Exercise 14.24

Consider the universal relation R = `{A, B, C, D, E, F, G, H, I, J}` and the set of functional dependencies `F = {{A, B}→{C}, {A}→{D, E}, {B}→{F}, {F}→{G, H}, {D}→{I, J}}`. What is the key for `R`? Decompose `R` into 2NF and then 3NF relations.

### Answer

- **Given**

  | A    | B    | C    | D    | E    | F    | G    | H    | I    | J    |
  | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    |      |      |      |      |      |      |      |
  | ◎    |      |      | ↑    | ↑    |      |      |      |      |      |
  |      | ◎    |      |      |      | ↑    |      |      |      |      |
  |      |      |      |      |      | ◎    | ↑    | ↑    |      |      |
  |      |      |      | ◎    |      |      |      |      | ↑    | ↑    |

- **1NF**

  | A    | B    | C    | D    | E    | F    | G    | H    | I    | J    |
  | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    | ↑    | ↑    | ↑    | ↑    | ↑    | ↑    | ↑    |
  | ◎    |      |      | ↑    | ↑    |      |      |      | ↑    | ↑    |
  |      | ◎    |      |      |      | ↑    | ↑    | ↑    |      |      |
  |      |      |      |      |      | ◎    | ↑    | ↑    |      |      |
  |      |      |      | ◎    |      |      |      |      | ↑    | ↑    |

​	Key for `R` is `{A, B}`

- **2NF**

  | A    | B    | C    |      | A    | D    | E    | I    | J    |      | B    | F    | G    | H    |
  | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    |      | ◎    | ↑    | ↑    | ↑    | ↑    |      | ◎    | ↑    | ↑    | ↑    |
  |      |      |      |      |      | ◎    |      | ↑    | ↑    |      |      | ◎    | ↑    | ↑    |

- **3NF**

  | A    | B    | C    |      | A    | D    | E    |      | B    | F    |      | F    | G    | H    |      | D    | I    | J    |
  | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    |      | ◎    | ◎    | ◎    |      | ◎    | ↑    |      | ◎    | ↑    | ↑    |      | ◎    | ↑    | ↑    |



## 2. Exercise 14.27

Consider a relation `R(A, B, C, D, E)` with the following dependencies:
 AB → C, CD → E, DE → B
 Is `AB` a candidate key of this relation? If not, is `ABD`? Explain your answer.

### Answer

- **Given**

  | A    | B    | C    | D    | E    |
  | ---- | ---- | ---- | ---- | ---- |
  | ◎    | ◎    | ↑    |      |      |
  |      |      | ◎    | ◎    | ↑    |
  |      | ↑    |      | ◎    | ◎    |

  `{A, B}` is not a candidate key because it need `{C, D}` to relate to `E`

  `{A, B, D}` is a candidate key.



## 3. Exercise 14.30

Consider the following relation:

```
CAR_SALE(Car#, Date_sold, Salesperson#, Commission%, Discount_amt)
```

Assume that a car may be sold by multiple salespeople, and hence `{Car#, Salesperson#}` is the primary key. Additional dependencies are

```
Date_sold → Discount_amt and
Salesperson# → Commission%
```

Based on the given primary key, is this relation in 1NF, 2NF, or 3NF? Why or why not? How would you successively normalize it completely?

### Answer

- **Given (in 1NF)**

  | Car# | Date_sold | Salesperson# | Commission% | Discount_amt |
  | ---- | --------- | ------------ | ----------- | ------------ |
  | ◎    | ↑         | ◎            | ( ↑ )       | ( ↑ )        |
  |      | ◎         |              |             | ↑            |
  |      |           | ◎            | ↑           |              |

  It's in 1NF because FD3 use partial key as it's key.

- **2NF**

  | Car# | Date_sold | Salesperson# | Discount_amt |      | Salesperson# | Commission% |
  | ---- | --------- | ------------ | ------------ | ---- | ------------ | ----------- |
  | ◎    | ↑         | ◎            | ↑            |      | ◎            | ↑           |
  |      | ◎         |              | ↑            |      |              |             |

- **3NF**

  | Car# | Date_sold | Salesperson# |      | Salesperson# | Commission% |      | Date_sold | Discount_amt |
  | ---- | --------- | ------------ | ---- | ------------ | ----------- | ---- | --------- | ------------ |
  | ◎    | ↑         | ◎            |      | ◎            | ↑           |      | ◎         | ↑            |



## 4. 

Suppose you are given a relation *R* with four attributes *ABCD*. For each of the following sets of FDs, assuming those are the only dependencies that hold for *R*, do the following:

- **a.** Identify the candidate key(s) for *R*.
- **b.** Identify the best normal form that *R* satisfies (1NF, 2NF, 3NF, or BCNF).
- **c.** If *R* is not in BCNF, decompose it into a set of BCNF relations that preserve the dependencies.



- **C → D, C → A, B → C**
- **AB → C, AB → D, C → A, D → B**

### Answer

- **C → D, C → A, B → C**

  - **Given (2NF)**

    | A     | B    | C    | D     |
    | ----- | ---- | ---- | ----- |
    | ↑     |      | ◎    | ↑     |
    | ( ↑ ) | ◎    | ↑    | ( ↑ ) |

    - **a.** Candidate key is `{B}`

    - **b.** Best normal form is 2NF

    - **c.** BCNF

      | B    | C    |      | C    | A    | D    |
      | ---- | ---- | ---- | ---- | ---- | ---- |
      | ◎    | ↑    |      | ◎    | ↑    | ↑    |

- **AB → C, AB → D, C → A, D → B**

  - **Given (3NF)**

    | A    | B    | C    | D    |
    | ---- | ---- | ---- | ---- |
    | ◎    | ◎    | ↑    | ↑    |
    | ↑    |      | ◎    |      |
    |      | ↑    |      | ◎    |

    - **a.** Candidate key is `{A, B}`, `{C, D}`, `{A, D}`, `{B, C}`

    - **b.** Best normal form is 3NF

    - **c.** BCNF

      | A    | C    |      | B    | C    |      | A    | D    |      | B    | D    |
      | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
      | ↑    | ◎    |      | ◎    | ◯    |      | ◎    | ◯    |      | ↑    | ◎    |



## 5. Exercise 22.27

What implications would a no-steal/force buffer management policy have on checkpointing and recovery?

### Answer

**Impact of the No-Steal Policy:**

- The No-Steal policy dictates that cached page frames modified by uncommitted transactions must not be written back to disk.
- This means that the disk only ever contains data from committed transactions or unmodified data from before the transaction began.
- Therefore, during system crash recovery, no UNDO operations are necessary on the disk data, since no "dirty" uncommitted data ever pollutes the disk.

**Impact of the Force Policy:**

- The Force policy requires that once a transaction commits, all its updates must be immediately written to disk before the commit is considered complete.
- This ensures that the results of all committed transactions are persisted on disk.
- Therefore, during system crash recovery, no REDO operations are needed for these committed transactions, as their changes are already present on disk.

**Overall Impact of the Combined No-Steal/Force Policy:**

- Due to the No-Steal policy, the integrity of disk data is guaranteed (it only contains committed data).
- Due to the Force policy, all changes from committed transactions are already on disk.
- As a result, during recovery after a system crash, neither UNDO nor REDO operations are required. This greatly simplifies the recovery logic and speeds up the recovery process.
- The checkpointing process is also simplified, as there is no need to log complex information about uncommitted transactions for UNDO, nor to maintain a list of committed transactions requiring REDO.



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
