# AlgebraicTemplate.jl

[![Stable Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://AlgebraicJulia.github.io/AlgebraicTemplate.jl/stable)
[![Development Documentation](https://img.shields.io/badge/docs-dev-blue.svg)](https://AlgebraicJulia.github.io/AlgebraicTemplate.jl/dev)
[![CI/CD](https://github.com/AlgebraicJulia/AlgebraicTemplate.jl/actions/workflows/julia_ci.yml/badge.svg)](https://github.com/AlgebraicJulia/AlgebraicTemplate.jl/actions/workflows/julia_ci.yml)
[![Code Coverage](https://codecov.io/gh/AlgebraicJulia/AlgebraicTemplate.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/AlgebraicJulia/AlgebraicTemplatee.jl)

A template repository for making a new AlgebraicJulia package.

## 🛠️ Usage

1. Use the "Use this template" dropdown to select "Create a new repository"
2. In the new page select "AlgebraicJulia" as the owner, give the repository a name such as "AlgebraicX.jl", and create a new repository from the template
3. Set up Codecov credentials for code coverage (If you have trouble, reach out to an AlgebraicJulia organization owner to help with this)

   1. Log into [Codecov](https://codecov.io) with your GitHub account (this requires that you are a member of the AlgebraicPetri organization)
   2. Navigate to the [AlgebraicJulia organization](https://app.codecov.io/gh/AlgebraicJulia)
   3. Select your new repository from the list (e.x. "AlgebraicX")
   4. Note down the `CODECOV_TOKEN` value (It may be in the "Settings" tab if it doesn't show up immediately)
   5. Navigate back to your new GitHub repository and go to the Settings tab
   6. Go to "Security", "Secrets and variables", and "Actions" and click the "New repository secret" button
   7. Give the secret name `CODECOV_TOKEN` and the Secret value is the value you noted from the Codecov settings
   8. Click "Add secret"

4. Clone the new repository, for example in the terminal:
   ```sh
   git clone https://github.com/AlgebraicJulia/AlgebraicX.jl.git
   cd AlgebraicX.jl
   ```
5. Rename the file `src/AlgebraicTemplate.jl` to match the name of your new package (e.x. "AlgebraicX")
   ```sh
   mv src/AlgebraicTemplate.jl src/AlgebraicX.jl
   ```
6. Replace all instances of the word "AlgebraicTemplate" with your new package name (e.x. "AlgebraicX")
   ```sh
   # On linux
   git grep -l 'AlgebraicTemplate' | xargs sed -i 's/AlgebraicTemplate/AlgebraicX/g'
   # On Mac OS X
   git grep -l 'AlgebraicTemplate' | xargs sed -i '' -e 's/AlgebraicTemplate/AlgebraicX/g'
   ```
7. Generate a new random version 4 UUID (you can get one here: https://www.uuidgenerator.net/version4)
   - We will assume for this example that your new UUID is `<UUID>`
8. Replace all instances of the template's UUID, "b66562e1-fa90-4e8b-9505-c909188fab76", with your new UUID (e.x. "<UUID>")
   ```sh
   # On linux
   git grep -l 'b66562e1-fa90-4e8b-9505-c909188fab76' | xargs sed -i 's/b66562e1-fa90-4e8b-9505-c909188fab76/<UUID>/g'
   # On Mac OS X
   git grep -l 'b66562e1-fa90-4e8b-9505-c909188fab76' | xargs sed -i '' -e 's/b66562e1-fa90-4e8b-9505-c909188fab76/<UUID>/g'
   ```
9. Commit these new changes to your repository
   ```sh
   git commit -am "Set up skeleton for AlgebraicX.jl"
   git push
   ```
10. Go back to your repository and wait until the tests have passed, you can check the status by going to the "Actions" tab in the repository
