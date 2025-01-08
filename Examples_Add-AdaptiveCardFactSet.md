# Example Add-AdaptiveCardFactSet

Function `Add-AdaptiveCardFactSet` adds a Fact Set to an Adaptive Card. Fact Set is a set of key-value pairs.

## Media Parameters

You can add up to 9 key-value pairs. Each pair is defined by two parameters: `FactN` and `ValueN`, where `N` is a number from 1 to 9.

| Parameter       | Default   | Available Values                                                       | Required | Description                         |
| --------------- | --------- | ---------------------------------------------------------------------- | -------- | ----------------------------------- |
| `-AdaptiveCard` | -         | AdaptiveCard object                                                    | Yes      | Adaptive Card object                |
| `-Height`       | `auto`    | `auto`, `stretch`                                                      | No       | Specifies the height of the element |
| `-Separator`    | `false`   | `true`, `false`                                                        | No       | Draw a separating line at the top   |
| `-Spacing`      | `default` | `default`, `none`, `small`, `medium`, `large`, `extraLarge`, `padding` | No       | Space before the block              |
| `-FactN`        | -         | -                                                                      | Yes      | Fact key for segment N              |
| `-ValueN`       | -         | -                                                                      | Yes      | Fact value for segment N            |

## Examples

### Basic usage

```powershell
Add-AdaptiveCardFactSet -AdaptiveCard $AdaptiveCard `
   -Fact1 "Status" -Value1 "In Progress" `
   -Fact2 "Priority" -Value2 "High" `
   -Fact3 "Assigned to" -Value3 "John Doe" `
   -Fact4 "Due date" -Value4 "2021-12-31"
```

![Example Add-AdaptiveCardFactSet](img/example-factset01.png)
