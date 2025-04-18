# 🇵🇱🤖 Kimczym – Polish Grammar Bot

**Kimczym** is a Telegram bot that helps you master **Polish grammar** by showing you full declension tables for **nouns** and **adjectives**. It even adds a bit of fun by throwing in the occasional **funny GIF** to keep things entertaining!

---

## 📌 Features

- 💬 Declension breakdown for **Polish nouns** *and* **adjectives**
- ✅ Supports all grammatical cases:
  - **Mianownik** (Nominative)
  - **Dopełniacz** (Genitive)
  - **Celownik** (Dative)
  - **Biernik** (Accusative)
  - **Narzędnik** (Instrumental)
  - **Miejscownik** (Locative)
  - **Wołacz** (Vocative)
- 🔤 Adjective forms include:
  - Degrees of comparison: **positive**, **comparative**, **superlative**
  - Gender and number options: **masculine**, **feminine**, **neuter**, **plural**
- 😄 Sends a **funny GIF** (because grammar doesn’t have to be boring)
- 🕹️ Simple UI with clickable buttons to choose gender, case, degree, etc.

---

## 🧠 Use Case

Perfect for:
- Learners of Polish grammar (from beginner to advanced)
- Language teachers & tutors
- Anyone who wants to double-check declension on the fly

---

## 🚀 How to Use

1. Start the bot in Telegram.
2. Type a **Polish noun** or **adjective**.
3. Click on one of the buttons to refine the query (e.g. gender, number, degree).
4. Get a complete declension table.
5. Occasionally, enjoy a **GIF reaction** to your linguistic journey.

---

## 🧪 Examples

### 🐸 Example Noun: `żabka` (little frog)

**Singular Declension:**
| Case         | Question         | Form   |
|--------------|------------------|--------|
| Mianownik    | (kto? co?)       | żabka  |
| Dopełniacz   | (kogo? czego?)   | żabki  |
| Celownik     | (komu? czemu?)   | żabce  |
| Biernik      | (kogo? co?)      | żabkę  |
| Narzędnik    | (z kim? z czym?) | żabką  |
| Miejscownik  | (o kim? o czym?) | żabce  |
| Wołacz       | (o! hej!)        | żabko  |

---

### 🎨 Example Adjective: `piękny` (beautiful)

**Singular, Masculine:**
| Case         | Question     | Form       |
|--------------|--------------|------------|
| Mianownik    | (jaki?)      | piękny     |
| Dopełniacz   | (jakiego?)   | pięknego   |
| Celownik     | (jakiemu?)   | pięknemu   |
| Biernik      | (jaki?)      | piękny     |
| Narzędnik    | (z jakim?)   | pięknym    |
| Miejscownik  | (o jakim?)   | pięknym    |
| Wołacz       | (jaki?)      | piękny     |

---

## 🖼️ Screenshots

![Alt text](https://kimczym.s3.us-west-2.amazonaws.com/screen.jpg "Kimczym Screenshot")

---

## 🛠️ Running Locally

If you want to run this bot on your own machine:

```bash
rake telegram:bot:poller
