/*
Maximizar: 3x + 4y

Sujeto a:
    2x + y <= 14
    4x + 3y <= 35
    x , y >= 0
*/

#include "ortools/linear_solver/linear_solver.h"
#include <iostream>

namespace operations_research {
void SimpleLinearProgram() {
  // Crear el solver usando GLOP, el solver de programación lineal de Google.
  std::unique_ptr<MPSolver> solver(MPSolver::CreateSolver("GLOP"));
  if (!solver) {
    std::cerr << "GLOP solver no está disponible." << std::endl;
    return;
  }

  // Crear las variables x y y.
  const double infinity = solver->infinity();
  MPVariable* const x = solver->MakeNumVar(0.0, infinity, "x");
  MPVariable* const y = solver->MakeNumVar(0.0, infinity, "y");

  // Crear la función objetivo: 3x + 4y.
  MPObjective* const objective = solver->MutableObjective();
  objective->SetCoefficient(x, 3);
  objective->SetCoefficient(y, 4);
  objective->SetMaximization();

  // Crear las restricciones:
  // 2x + y <= 14.
  MPConstraint* const c0 = solver->MakeRowConstraint(-infinity, 14.0);
  c0->SetCoefficient(x, 2);
  c0->SetCoefficient(y, 1);

  // 4x + 3y <= 35.
  MPConstraint* const c1 = solver->MakeRowConstraint(-infinity, 35.0);
  c1->SetCoefficient(x, 4);
  c1->SetCoefficient(y, 3);

  // Resolver el problema.
  const MPSolver::ResultStatus result_status = solver->Solve();

  // Verificar si se encontró una solución óptima.
  if (result_status != MPSolver::OPTIMAL) {
    std::cerr << "No se encontró una solución óptima." << std::endl;
    return;
  }

  std::cout << "Solución encontrada:" << std::endl;
  std::cout << "Valor óptimo: " << objective->Value() << std::endl;
  std::cout << "x = " << x->solution_value() << std::endl;
  std::cout << "y = " << y->solution_value() << std::endl;
}
}  // namespace operations_research

int main() {
  operations_research::SimpleLinearProgram();
  return 0;
}
