enum TodoTab {
  all,
  importants,
}

extension TodoTabExtenstion on TodoTab {
  bool get isAll => this == TodoTab.all;
  bool get isImportants => this == TodoTab.importants;
}
